.PHONY: run stop build

dir = $(shell pwd)
data = $(shell dirname $(shell dirname $(dir)))/data/$(notdir $(shell pwd))
name = postgres
image = postgres

MOUNT = -v $(data)/data:/var/lib/postgresql/data
PORTS =
LINKS =
OTHER = --restart=always -e POSTGRES_PASSWORD=
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
