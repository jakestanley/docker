#/usr/bin/env bash

docker run -d -p 8112:8112 -p 1080:1080 -p 58846:58846 \
    --name vpn \
    --restart=always \
    --dns=8.8.8.8 \
    --cap-add=NET_ADMIN \
    -v /var/media:/torrents \
    -v $HOME/docker/deluge:/app/deluge \
    -v /etc/localtime:/etc/localtime:ro \
    -e DELUGE_UID=1001 -e DELUGE_GID=1001 \
    -e HOST_SUBNET=192.168.0.0/24 \
    -e PIA_USER=$(cat ~/.credentials/pia_user) \
    -e PIA_PASS=$(cat ~/.credentials/pia_pass) \
    -e PIA_GATEWAY=sweden.privateinternetaccess.com \
bantam/docker-piavpn-arm
