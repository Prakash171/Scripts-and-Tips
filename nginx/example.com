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

