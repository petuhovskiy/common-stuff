.PHONY: init run client

OVPN_DATA="ovpn-main-data"
HOST=host.domain
NAME=ovpnsrv

PORT=443
PROT=udp

init:
	docker run --name $(OVPN_DATA) -v /etc/openvpn busybox
	docker run --volumes-from $(OVPN_DATA) --rm kylemanna/openvpn ovpn_genconfig -u $(PROT)://$(HOST):$(PORT)
	docker run --volumes-from $(OVPN_DATA) --rm -it kylemanna/openvpn ovpn_initpki

run:
	-docker rm -f $(NAME)
	docker run --volumes-from $(OVPN_DATA) -d --restart=always --name $(NAME) -p $(PORT):1194/$(PROT) --cap-add=NET_ADMIN kylemanna/openvpn

client:
	$(eval CLIENTNAME := $(shell read -p "Client name: " cliname; echo $$cliname))
	docker run --volumes-from $(OVPN_DATA) --rm -it kylemanna/openvpn easyrsa build-client-full $(CLIENTNAME) nopass
	docker run --volumes-from $(OVPN_DATA) --rm kylemanna/openvpn ovpn_getclient $(CLIENTNAME) > $(CLIENTNAME).ovpn
