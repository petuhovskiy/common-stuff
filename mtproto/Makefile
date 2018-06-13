.PHONY: run stop build

dir = $(shell pwd)
data = $(shell dirname $(shell dirname $(dir)))/data/$(notdir $(shell pwd))
name = mtproxy
image = alexdoesh/mtproxy:latest

MOUNT = -v $(data):/data
PORTS = -p 0.0.0.0:8080:443
LINKS =
OTHER = --restart unless-stopped
ARGS =

run:
	-docker rm -f $(name)
	docker run --name $(name) \
		$(MOUNT) \
		$(PORTS) \
		$(LINKS) \
		$(OTHER) \
		-d $(image)

build:
	docker build -t $(image) .

stop:
	docker stop $(name)
