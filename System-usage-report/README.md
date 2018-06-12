These scripts can be used for monitoring/creating server usage reports - Memmory, DISK, CPU 

i.e. script revoking another script [ status-check.sh revoking check.sh ]

status-check.sh 
                
                 ---> is used to create a empty file and perform ssh to remote server and run check.sh script on remote server and also to save output to a file
                 
                 ---> the name of the file in this case is ip-address of the server which can be passed as a parameter to the script 
                 
                 ---> this is also used as the IP for ssh operation
                 
                      Example: ./status-check.sh 172.255.255.255
                 
                      in this case the usage report is created with name IP-172.255.255.255 and also establishes ssh connection to <user-name>@172.255.255.255

Syntax:

./status-check.sh <IP-address>

(or)

./status-check.sh <IP-address> &     #This is to make shell script run background

(or)

nohup ./status-check.sh <IP-address> </dev/null >nohup.out 2>nohup.err &    #This is to make shell script run background even if the session is disconnected. 

