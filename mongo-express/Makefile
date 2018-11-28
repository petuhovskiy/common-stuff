.PHONY: build no-cache-build run runit stop pull logs
SHELL := /bin/bash

dir = $(shell pwd)
data = $(shell dirname $(shell dirname $(dir)))/data/$(notdir $(shell pwd))
name = mongoexp
image = mongo-express

ME_CONFIG_BASICAUTH_USERNAME = $(shell source .env && echo $$ME_CONFIG_BASICAUTH_USERNAME)
ME_CONFIG_BASICAUTH_PASSWORD = $(shell source .env && echo $$ME_CONFIG_BASICAUTH_PASSWORD)

MOUNT =
PORTS = -p 8081:8081
LINKS = --link mongodb:mongo
OTHER = --restart=always
ENV = --env ME_CONFIG_BASICAUTH_USERNAME=$(ME_CONFIG_BASICAUTH_USERNAME) --env ME_CONFIG_BASICAUTH_PASSWORD=$(ME_CONFIG_BASICAUTH_PASSWORD)
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
