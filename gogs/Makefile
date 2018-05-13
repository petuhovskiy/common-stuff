.PHONY: run stop build

dir = $(shell pwd)
data = $(shell dirname $(shell dirname $(dir)))/data/$(notdir $(shell pwd))
name = gogs
image = gogs/gogs

MOUNT = -v $(data)/data:/data
PORTS = -p 3003:3000 -p 10022:22
LINKS = --link postgres
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
