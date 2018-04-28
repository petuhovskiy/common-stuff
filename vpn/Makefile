.PHONY: init run client

OVPN_DATA="ovpn-main-data"
HOST=host.domain
NAME=ovpnsrv

PORT=443
PROTO=udp

init:
	docker run --name $(OVPN_DATA) -v /etc/openvpn busybox
	docker run --volumes-from $(OVPN_DATA) --rm kylemanna/openvpn ovpn_genconfig -u $(PROTO)://$(HOST):$(PORT)
	docker run --volumes-from $(OVPN_DATA) --rm -it kylemanna/openvpn ovpn_initpki

run:
	-docker rm -f $(NAME)
	-docker rm -f $(NAME)_tcp
	docker run --volumes-from $(OVPN_DATA) -d --restart=always --name $(NAME) -p $(PORT):1194/udp --cap-add=NET_ADMIN kylemanna/openvpn
	docker run --volumes-from $(OVPN_DATA) -d --restart=always --name $(NAME)_tcp -p $(PORT):1194/tcp --cap-add=NET_ADMIN kylemanna/openvpn ovpn_run --proto tcp

client:
	$(eval CLIENTNAME := $(shell read -p "Client name: " cliname; echo $$cliname))
	docker run --volumes-from $(OVPN_DATA) --rm -it kylemanna/openvpn easyrsa build-client-full $(CLIENTNAME) nopass
	docker run --volumes-from $(OVPN_DATA) --rm kylemanna/openvpn ovpn_getclient $(CLIENTNAME) > $(CLIENTNAME).ovpn
