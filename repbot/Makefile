.PHONY: run stop build

dir = $(shell pwd)
data = $(shell dirname $(shell dirname $(dir)))/data/$(notdir $(shell pwd))
name = repcryptbot
image = noderepbot
srcdir = src

MOUNT =
PORTS =
LINKS = --link mongodb:mongo
OTHER = --restart=always
ARGS =

clone:
	git clone https://github.com/petuhovskiy/tg-reputation-bot $(srcdir)

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
