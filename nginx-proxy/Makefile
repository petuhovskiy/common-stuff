.PHONY: run stop build

dir = $(shell pwd)
data = $(shell dirname $(shell dirname $(dir)))/data/$(notdir $(shell pwd))
certs = $(shell dirname $(shell dirname $(dir)))/data/certs
name = nginx-proxy
image = jwilder/nginx-proxy

MOUNT = -v /var/run/docker.sock:/tmp/docker.sock:ro -v $(certs):/etc/nginx/certs:ro -v /etc/nginx/vhost.d -v /usr/share/nginx/html
PORTS = -p 80:80 -p 443:443
LINKS =
OTHER = --restart=always
ARGS = --label com.github.jrcs.letsencrypt_nginx_proxy_companion.nginx_proxy

build:
		docker build -t $(image) .

no-cache-build:
		docker build -t $(image) --no-cache .

run:
		-docker rm -f $(name)
		docker run --name $(name) \
				$(MOUNT) \
				$(PORTS) \
				$(LINKS) \
				$(OTHER) \
				-d $(image)

runit:
	docker run --rm -i -t \
		$(MOUNT) \
		$(PORTS) \
		$(LINKS) \
		$(image) $(ARGS) 

stop:
		docker stop $(name)

logs:
	docker logs -f $(name)
