#!/bin/bash

read -p  "Hello what is the username? " username

if [ ! -d "$username-repo" ]
then
        mkdir "$username-repo"
else
        echo    # "the directory "$username-repo" already exists"
fi

openssl genrsa -out "$username.key" 2048
# mv "$username.key" "$username-repo"
openssl req -new -key "$username.key" -out "$username.csr" -subj "/CN=$username"
cp ca_cert.crt "$username-repo"
mv "$username.key" "$username.csr" "$username-repo"
cd "$username-repo"


csr=$(cat "$username.csr" | base64 | tr -d "\n")

# create the csr from kubernetes perspective
cat <<EOF | kubectl apply -f -
apiVersion: certificates.k8s.io/v1
kind: CertificateSigningRequest
metadata:
  name: "$username"
spec:
  request: $csr
  signerName: kubernetes.io/kube-apiserver-client
  expirationSeconds: 86400  # one day
  usages:
  - client auth
EOF

 kubectl certificate approve "$username"


 kubectl get csr "$username" -o jsonpath='{.status.certificate}'| base64 -d > "$username.crt"

# generate the kubeconfig of the newly created user

# 1 set-cluster 
# ca_cert=$(cat ca-cert.crt 
kubectl config --kubeconfig="config-$username.yaml" set-cluster minikube  --server="https://192.168.49.2:8443" --certificate-authority=ca_cert.crt --embed-certs=true


# 2 add user to the config
# crt=$(cat $username.crt)
# key=$(cat $username.key)
kubectl config --kubeconfig="config-$username.yaml" set-credentials "$username" --client-certificate="$username.crt" --client-key="$username.key" --embed-certs=true

# 3 add context details to the config
kubectl config --kubeconfig="config-$username.yaml" set-context "$username" --cluster=minikube --user="$username"

# 4 set the new context for being used 
kubectl config --kubeconfig="config-$username.yaml" use-context "$username"

chmod +r "config-$username.yaml"

kubectl create clusterrolebinding "$username-binding" --clusterrole view --user "$username"

echo """


==============================================================================================================================================

    NICE THE USER $username HAS BEEN CREATED SUCCESFULLY. YOU WILL THE FIND THE APPROPRIATE CONFIG FILE UNDER THE  $username-repo DIRECTORY

==============================================================================================================================================

"""