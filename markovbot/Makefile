.PHONY: run stop build clone

dir = $(shell pwd)
data = $(shell dirname $(shell dirname $(dir)))/data/$(notdir $(shell pwd))
name = markovbot
image = nodemarkovbot
srcdir = src

MOUNT =
PORTS =
LINKS = --link mongodb:mongo
OTHER = --restart=always
ARGS =

clone:
	git clone https://github.com/petuhovskiy/markov-bot $(srcdir)

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
