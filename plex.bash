#!/usr/bin/env bash

docker run -d \
	--name plex \
	--net=host \
	--restart=always \
	-v /var/media:/media \
jaymoulin/rpi-plex:latest
