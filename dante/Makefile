.PHONY: run stop build

dir = $(shell pwd)
data = $(shell dirname $(shell dirname $(dir)))/data/$(notdir $(shell pwd))
name = dante
image = schors/tgdante2

MOUNT =
PORTS = -p 0.0.0.0:1080:1080
LINKS =
OTHER = --restart unless-stopped -e USER=arthur -e PASS=password
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
