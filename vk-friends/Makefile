.PHONY: run stop build clone

dir = $(shell pwd)
data = $(shell dirname $(shell dirname $(dir)))/data/$(notdir $(shell pwd))
name = friends-vk
image = vk-utils
srcdir = src

MOUNT =
PORTS =
LINKS = --link mongodb:mongo
OTHER = --restart=always -e VIRTUAL_HOST=friends.rwlist.io
ARGS =

clone:
	git clone https://github.com/petuhovskiy/vk-utils $(srcdir)

pull:
	cd $(srcdir)
	git pull
	cd ..

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

runit:
	docker run --rm -i -t \
		$(MOUNT) \
		$(PORTS) \
		$(LINKS) \
		$(image) $(ARGS)

stop:
	docker stop $(name)
