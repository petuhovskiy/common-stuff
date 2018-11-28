.PHONY: run stop build

dir = $(shell pwd)
data = $(shell dirname $(shell dirname $(dir)))/data/$(notdir $(shell pwd))
certs = $(shell dirname $(shell dirname $(dir)))/data/certs
name = letsencrypt
image = jrcs/letsencrypt-nginx-proxy-companion

MOUNT = -v $(certs):/etc/nginx/certs:rw -v /var/run/docker.sock:/var/run/docker.sock:ro --volumes-from nginx-proxy
PORTS =
LINKS =
OTHER = --restart=always
ARGS =

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

force_renew:
	docker exec $(name) /app/force_renew

cert_status:
	docker exec $(name) /app/cert_status
