.PHONY: run stop build mongo-shell

dir = $(shell pwd)
data = $(shell dirname $(shell dirname $(dir)))/data/$(notdir $(shell pwd))
name = mongodb
image = mongo

MOUNT = -v $(data)/data:/data/db
PORTS =
LINKS =
OTHER = --restart=always
ARGS = --storageEngine wiredTiger

build:
	docker build -t $(image) .

mongo-shell:
	docker exec -t -i $(name) mongo shell

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
