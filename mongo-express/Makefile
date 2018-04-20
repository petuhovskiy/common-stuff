.PHONY: run stop build

dir = $(shell pwd)
data = $(shell dirname $(shell dirname $(dir)))/data/$(notdir $(shell pwd))
name = mongoexp
image = mongo-express

MOUNT =
PORTS = -p 8081:8081
LINKS = --link mongodb:mongo
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
