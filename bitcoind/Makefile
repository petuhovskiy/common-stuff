.PHONY: run stop build run-volume

dir = $(shell pwd)
data = $(shell dirname $(shell dirname $(dir)))/data/$(notdir $(shell pwd))
name = bitcoind-node
image = kylemanna/bitcoind

MOUNT = -v bitcoind-data:/bitcoin
PORTS = -p 8333:8333 -p 0.0.0.0:8332:8332
LINKS =
OTHER = --restart=always

build:
		docker build -t $(image) .
run-volume:
		docker volume create --name=bitcoind-data
run:
		-docker rm -f $(name)
		docker run --name $(name) \
				$(MOUNT) \
				$(PORTS) \
				$(LINKS) \
				$(OTHER) \
				-d $(image)
stop:
		docker stop $(name)
