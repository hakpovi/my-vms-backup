![image](https://tse1.mm.bing.net/th?id=OIP.Bs7sCNIqtMZqJ4sAnG68YwHaEK&pid=Api&P=0&h=180)

**good command to know**
====================








xargs is a really powerfull command to master . brefly xargs positions some input from the pipe for instence and them provides them to another command
example: cat text.txt | xargs touch  ====> this command will create files regarding to the file contents

!5  for instance can be run to the terminal to execute the previous command run at the fifth position. The more occurate is to use along some command previously run. for instance
!ls

compgen -b ==> to display the builtin commands of shell

compgen -k ==> to display the keywords of shell

echo $!  this will print the PID of the command just run before
echo $$   this will print the PID of the parent shell
echo $BASHPID this will print the PID of the current shell
pgrep -o bash ==> to display the PID  of bash (shell parent)

ps -ef ==> to display the process

ps -ef | grep bash ==> to display the processes  related to bash

netstat -tlnp ==> to display the listen ports and their pid

set -o pipefail ==> this command can be set at the top of the script to prevent it from heading to faillure related to the pipe with the wrong exit code

set -o noclobber ==> as the pipefail command it is good to prevent the script from erasing an existing file using the > symbol

**prints command:**
===============

an example for printf unsing:     printf "Name: %s\nAge: %d\nHeight: %.2f meters\n"  "Alice" 30 1,75
Name: Alice
Age: 30
Height: 1,75 meters

### an example of file formating by using a conbination of: exec, read and echo

jinx we have this command to write a content towards a file like this ===>   echo "Juan Carlos@kodekloud.com" > email_file.txt

when we cat this file, it doesn"t look great since we have a space within the email address which is not what we want.

So to modify the file we can proceed like following:

1-  let's set a file descriptor for our file ==>  exec 3<> email_file.txt
2-  let's read the newly file descriptor (behind we have the file associated)  until the position we'd like to correct which is 4 in our case ==> read -n 4 <&3
3-  let's now echo the replacement ==> echo "." -n >&3
4-  let's close the file descriptor to effectivly deassociate the file descriptor from the email_file.txt ===>  exec 3>&-

so the final result will look like this:   Juan.Carlos@kodekloud.com

The short explanation for the steps we did in previous exercise is:

Assigned file descriptor 8 to abc.txt
Read the third character (starting from index 0) from file descriptor 8
Appended the d character on the 3rd position of file descriptor 8.
Closed file descriptor 8

```console
exec 8<> abc.txt
read -n 3 <&8
echo "d" >&8
exec 8>&-
```

**variable expansion**:
===================

to access a variable we use $ sign;  this technik is known as variable expansion which means the way to access a variable. We can suround the variable with curly braces.
The curly braces give a powerfull insight

way to manage the variable. By using curly braces, it provides some futures, we can slice our variable. example: name="John Doe"
to print the variable name we will use "${name}" . let's say we'd like to get some section of name. We can do for instance: "${name:0:4}" ==>  the result will be John.
In this scenario, the first number after the first column stands for the starting point of our slicing; the second value after the column stands for the lenght of the result we look for.
in another way we'll say:    "${name:start:lenght}"

**paramater expansion:** ( also known as substring replacement)
===========================================================

example: path="/home/user/file.txt"                   echo "${path/file/data}"

"${var/pattern/replacement}"   in this case our purpose is to look for the word "file" trough the variable "path" and then to replace it by data

We also can get the lenght of a variable by adding the #  sign in front of the variable inside the curly braces like this: echo "${#path}"
to remind:  echo $# will output the nomber of position paramaters

**how to use # and % to accomplish paramater expansion?**
=====================================================

We can use # sign followed by the pattern we'd like to remove from the original variable. Notice that # is only applied to a prefix and it's case sensitive
example: var="France_culture";  echo "${var#F}" will output rance_culture  since we remove the patern "F"
%
the % signs acts exactly like the # sign but the difference is it's applied to the suffix
example: var="France_culture";  echo "${var%e}" will output France_cultur  since we remove the patern "e"

by adding the wild card * it becomes more powerfull. let's have a look:

we can combine #  with * sign like this echo "${var#* }  ====> remove everything from the left and when you find the first space stop right there. It's called (shortest prefix removal)
we can combine %  (shortest suffix removal)  with * sign like this echo "${var% *}  ====> remove everything from the right and when you find the first space stop right there. It's called (shortest suffix removal)

we can also combine ##  with * sign like this echo "${var##* }  ====> remove everything from the left untill the last space and stop right there. It's called (longest prefix removal)
we can also combine %% (longest suffix removal) with * sign like this echo "${var%% *}  ====> remove everything from the right untill the last space and stop right there. It's called (longest suffixfix removal)

Definition:
pattern is a predictible or regular repeated sequence that can used to illustre something that can be recognizable

*Catching File descriptors*
=========================

To catch a Standard Output or Standard Error for the purpose of redirecting the data to a file, we can place the File Descriptor number before the redirection symbol. The code will be like this:

Redirection of Standard Error
ls -j 2> stderr.txt    ===> 2 is the file descriptor or output error

Redirection of Standard Output
ls -l > stdout.txt             1 is the file descriptor or starting output

Note: Remember that the redirection of Standard Output has an invisible 1 before the redirection symbol by default , so it does not need to be explicitly typed.*

Converting File descriptors
To Convert a file descriptor from one type to another, add to the syntax an ampersand symbol on the right side of the greater than redirection symbol, followed by the File Descriptor number:

Converting Stdout to Stderr
echo "I'm turning this Standard Output echo into a Standard Error" >&2

Converting Stderr to Stdout
ls -j 2>&1

Observe the difference between catching a File Descriptor to a place; and converting a File Descriptor to the opposite type.

#!/bin/bash
set -o pipefail

cat "${logfile}" | grep "ERROR" | sort | uniq -c || { echo "Error encountered in pipe commands" >&2; exit 1; }  ==> it is a really good technique to know in order to stop the execution of
a script in error case and exit with exit_error=1

Globs:
======

wild card
? *  \  []
?
the question mark wild card is used in glob patterns to match any single character in filename or path

Braces:
=======

. simple braces expansion ==> {a..d}

. nested braces expansion ==> {a..b}{1..3}

. step-based braces expansion ==> file{1..10..2}.txt  this expansion will create  files from 1 to 10 each file index  steped by 2

. Pre-and Postfix ==> touch  pre-{A..C}-post  this brace expansion will create files indexed from A to C. each one precedeted by pre- and terminated by -post

subshell:
=========

subshell is the new shell environment inside the main shell. To create a subshell inside a shell script we just need to run our commands inside a simple parentheses (commands)

good to know ==> For instance, each sh section of command inside a jenkinsfile for the pipeline is a subshell

inside the parentheses, we can run multiple commands as we want; each section of command separated by ; or | depending on our need.
We also can run the commands each one back to a new line like this

(
    command1
    command2
    command3
)
but the most comonly used is the single line like this : command1 ; command2; command3

when we create a new subshell it generates a process ID. we can display this PID by running echo $BASHPID

the output from the subshell is not sent back to the parent shell

There is a technique to propage back  to the parent shell the output from the subshell.

NB: This technique can be applied to other situatons like in jenkins jobs or other places when we want the execution inside the subshell beeing part of the main executiv bloc of the scripts.

example:

```python
#!/usr/bin/env bash
counter=1
(
    counter=$((counter+1))
    echo "${counter}"      =================> 2
)

    echo "${counter}"      ==================> 1
```

this example shows that the subshell doesn't propage back to the parent shell its output. so that we have two different values. Let's correct that behavior like following:

```python
#!/usr/bin/env bash

# special shell variable $$, to create a unique number for the temporay file

tmpfile="/tmp/$$.tmp"  
counter=1

echo "${counter}" > ${tmpfile}

# Re-assign the value of the counter by using an arithmetic expansion
(
    counter="$(($(cat ${tmpfile}) +1 ))" 
    echo "${counter}" > ${tmpfile}
)
# Re-assign the value of the counter by doing a cat to tmpfile. So that we got the output from the subshell into the main shell 

counter=$(cat ${tmpfile})  

echo "${counter}"
unlink "${tmpfile}"    # Really important
```

NB: once we're down with all do not forget to unlink the tempfile  like this : unlink "${tmpfile}" . So that it will remove the singe file. otherwise we may have a risk to create a new file
each time we run this script

Note that unlike command acts like a rm command, but the difference is rm command doesn't remove a symbolik link but at the opposite unlike command can do it. So  keep that in mind.

Which of the following is a parameter expansion to default value?

"${name:-john}"
