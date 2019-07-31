.PHONY: build no-cache-build run runit stop pull logs
SHELL := /bin/bash

dir = $(shell pwd)
data = $(shell dirname $(shell dirname $(dir)))/data/$(notdir $(shell pwd))
name = cardbluff
image = cardbluff

CB_TOKEN = $(shell source .env && echo $$TOKEN)
CB_HOST = $(shell source .env && echo $$HOST)
HOST = cardbluff.rwlist.io

MOUNT = -v $(dir)/data:/var/data
PORTS =
LINKS =
OTHER = --restart=always
ENV = -e VIRTUAL_HOST=$(HOST) -e LETSENCRYPT_HOST=$(HOST) -e LETSENCRYPT_EMAIL=a@rwlist.io \
	-e TOKEN=$(CB_TOKEN) -e HOST=$(CB_HOST)
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
