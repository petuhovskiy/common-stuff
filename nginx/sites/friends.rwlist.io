server {
	listen *:80;
	server_name friends.rwlist.io;

	location / {
		proxy_pass http://friends-vk:3000;
		proxy_http_version 1.1;
		proxy_set_header Upgrade $http_upgrade;
		proxy_set_header Connection $connection_upgrade;
	}
}
