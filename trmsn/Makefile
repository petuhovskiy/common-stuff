.PHONY: run stop build

dir = $(shell pwd)
data = $(shell dirname $(shell dirname $(dir)))/data/$(notdir $(shell pwd))
name = transmission
image = linuxserver/transmission

MOUNT = -v $(dir)/config:/config \
	-v /srv/share/torrent:/downloads \
	-v /srv/share/twatch:/watch
PORTS = -p 51413:51413 -p 51413:51413/udp -p 9091:9091
LINKS =
OTHER = --restart=always -e Europe/Minsk

build:
		docker build -t $(image) .

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
