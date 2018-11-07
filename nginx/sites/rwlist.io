server {
	listen *:80;
	server_name rwlist.io;

	location / {
		proxy_pass http://rwlist;
		proxy_http_version 1.1;
		proxy_set_header Upgrade $http_upgrade;
		proxy_set_header Connection $connection_upgrade;
	}
}
