To install Nginx :

cd /etc/yum.repo.d/
vi nginx.repo 

[nginx]
name=nginx repo
baseurl=http://nginx.org/packages/centos/7/x86_64/
gpgcheck=0
enabled=1

yum install nginx -y


To install Nginx & also configure LDAP:

Pre requisites:
yum install gcc -y
yum install pcre-devel -y
yum install zlib-devel -y
yum install openssl-devel.x86_64 -y

Download nginx tar.gz file:

wget http://nginx.org/download/nginx-1.9.9.tar.gz
gunzip nginx-1.9.9.tar.gz
tar -xf nginx-1.9.9.tar
cd nginx-1.9.9
./configure --add-module=/root/nginx-auth-ldap

To add hostname to server:

vi /etc/hostname        #Add you server name here example.com

------------------------------------------------------------------------
configure nginx website:

cd /var/www/example.com/
index.html <directory>/  #can add index.html or for making webserver to browse files and directories can add directories to this path. 

cd /etc/nginx/

vi nginx.conf       #This configuration is customized to make nginx act as file server reading text, html, css files and viewing directories

user  nginx;
worker_processes  1;

error_log  /var/log/nginx/error.log warn;
pid        /var/run/nginx.pid;


events {
    worker_connections  1024;
}


http {
    include       /etc/nginx/mime.types;
    types {
    text/html                                        html htm shtml;
    text/css                                         css;
    }

    #default_type  application/octet-stream;

    log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                      '$status $body_bytes_sent "$http_referer" '
                      '"$http_user_agent" "$http_x_forwarded_for"';

    access_log  /var/log/nginx/access.log  main;
    sendfile        on;
    tcp_nopush     on;
    tcp_nodelay    on;

    keepalive_timeout  65;

    #gzip  on;

    include /etc/nginx/conf.d/*.conf;
    include /etc/nginx/sites-enabled/*;
}


mkdir sites-available
mkdir sites-enabled

cd sites-available
vi example.com

server {
        listen 80 default_server;

        root /var/www/example.com;

        index index.html;

        server_name example.com;

        location /builds {
                autoindex on;
                autoindex_exact_size off;
                autoindex_format html;
                autoindex_localtime on;
                try_files $uri $uri/ =404;
        }
}




cd ..
ln -s /etc/nginx/sites-available/bamboologs.xyz.com /etc/nginx/sites-enabled/bamboologs.xyz.com

#Finally restart the nginx service

service nginx restart




enjoy your basic website ! 

