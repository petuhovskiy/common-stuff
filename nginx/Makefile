.PHONY: run stop reload logs

dir = $(shell pwd)
data = $(shell dirname $(shell dirname $(dir)))/data/$(notdir $(shell pwd))
name = nginx
image = nginx:alpine

MOUNT = -v $(dir)/nginx.conf:/etc/nginx/nginx.conf:ro \
	-v $(dir)/sites:/sites \
	-v $(dir)/files:/files \
	-v $(dir)/mime.types:/etc/nginx/mime.types:ro \
	-v /srv/html:/srv/html
PORTS = -p 80:80
LINKS = --link friends-vk --link rwlist --link rwcore
OTHER = --restart=always

run:
	-docker rm -f $(name)
	docker run --name $(name) \
		$(MOUNT) \
		$(PORTS) \
		$(LINKS) \
		$(OTHER) \
		-d $(image)

stop:
	docker stop $(name)

reload:
	docker exec -t -i $(name) nginx -s reload

logs:
	docker logs -f $(name)
