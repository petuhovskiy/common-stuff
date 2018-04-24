.PHONY: run stop build

dir = $(shell pwd)
data = $(shell dirname $(shell dirname $(dir)))/data/$(notdir $(shell pwd))
name = snake
image = arthur/snake

MOUNT = -v $(dir)/data:/data
PORTS = -p 5228:8080
LINKS =
OTHER = --restart=always
ARGS =

build:
	docker build -t $(image) .

run:
	-docker rm -f $(name)
	docker run --name $(name) \
		$(MOUNT) \
		$(PORTS) \
		$(LINKS) \
		$(OTHER) \
		-d $(image) $(ARGS)

stop:
	docker stop $(name)

logs:
	docker logs -f $(name)
