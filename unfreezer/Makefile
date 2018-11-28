.PHONY: build no-cache-build run runit stop pull logs
SHELL := /bin/bash

dir = $(shell pwd)
data = $(shell dirname $(shell dirname $(dir)))/data/$(notdir $(shell pwd))
name = unfreezer
image = registry.gitlab.com/rwlist/standings-unfreezer

HOST = unfreezer.rwlist.io

MOUNT =
PORTS =
LINKS =
OTHER = --restart=always
ENV = -e VIRTUAL_HOST=$(HOST) -e LETSENCRYPT_HOST=$(HOST) -e LETSENCRYPT_EMAIL=a@rwlist.io
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
