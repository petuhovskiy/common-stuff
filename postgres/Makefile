.PHONY: build no-cache-build run runit stop pull logs
SHELL := /bin/bash

dir = $(shell pwd)
data = $(shell dirname $(shell dirname $(dir)))/data/$(notdir $(shell pwd))
name = postgres
image = postgres

POSTGRES_PASSWORD = $(shell source .env && echo $$POSTGRES_PASSWORD)

MOUNT = -v $(data)/data:/var/lib/postgresql/data
PORTS =
LINKS =
OTHER = --restart=always
ENV = -e POSTGRES_PASSWORD=$(POSTGRES_PASSWORD)
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
			$(ENV) \
			-d $(image)

runit:
	docker run --rm -i -t \
		$(MOUNT) \
		$(PORTS) \
		$(LINKS) \
		$(ENV) \
		$(image) $(ARGS)

stop:
	docker stop $(name)

rm:
	docker rm -f $(name)

pull:
	docker pull $(image)

logs:
	docker logs -f $(name)
