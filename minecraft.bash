#!/usr/bin/env bash

docker run -p 25565:25565 \
	-e EULA=TRUE \
	-e UID=$UID \
	-v $HOME/docker/minecraft:/data \
	--name minecraft \
	-it \
itzg/minecraft-server

