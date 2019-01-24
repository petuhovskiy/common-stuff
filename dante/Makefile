.PHONY: build no-cache-build run runit stop pull logs
SHELL = /bin/bash

dir = $(shell pwd)
data = $(shell dirname $(shell dirname $(dir)))/data/$(notdir $(shell pwd))
name = dante
image = schors/tgdante2

USER = $(shell source .env && echo $$USER)
PASS = $(shell source .env && echo $$PASS)

MOUNT =
PORTS = -p 0.0.0.0:2048:1080
LINKS =
OTHER = --restart unless-stopped
ENV = -e USER=$(USER) -e PASS=$(PASS)
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
		$(image) $(ARGS)

stop:
	docker stop $(name)

rm:
	docker rm -f $(name)

pull:
	docker pull $(image)

logs:
	docker logs -f $(name)
