  function count_down() {
  
    #!/bin/bash
    total_minuts=""
    total_seconds=""
    while getopts m:s: option 

    do 

    case "$option" in 

    m)  total_seconds=$(( $total_minuts + $OPTARG * 60 )) ;; 
        
        
    s)  total_seconds=$(( $total_seconds + $OPTARG )) ;;

        

    esac

    done

    while  [ $total_seconds -gt 0 ]
    do 
        echo $total_seconds
        total_seconds=$(( $total_seconds -1 ))
        sleep 1s
            
    done 

    echo "Time is up"
  }

  