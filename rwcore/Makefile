.PHONY: run stop build

dir = $(shell pwd)
data = $(shell dirname $(shell dirname $(dir)))/data/$(notdir $(shell pwd))
name = rwcore
image = registry.gitlab.com/rwlist/rwcore

MOUNT = -v $(dir)/conf:/conf
PORTS = --expose 9090
LINKS = --link mongodb
OTHER = --restart=always -e VIRTUAL_HOST=api.rwlist.io
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

pull:
	docker pull $(image)
