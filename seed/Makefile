.PHONY: run stop build

dir = $(shell pwd)
data = $(shell dirname $(shell dirname $(dir)))/data/$(notdir $(shell pwd))
name = metal-snake
image = awesome-app

MOUNT = -v $(dir)/data:/var/data
PORTS = -p 80:80
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