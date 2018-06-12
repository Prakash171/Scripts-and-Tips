To live sync a directory when ever changes made !

1. install inotify
2. create a file-sync.sh 
3. Create a file called sync.service in the directory /etc/systemd/system/ 
4. chmod 755 /etc/systemd/system/sync.service
5. systemctl daemon-reload
6. # Start your service
   systemctl start sync.service

   # Obtain your services' status
   systemctl status sync.service

   # Stop your service
   systemctl stop sync.service

   # Restart your service
   systemctl restart sync.service 
