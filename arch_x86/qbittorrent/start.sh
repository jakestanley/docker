#!/usr/bin/env bash
mkdir -p ~/homepage/config
mkdir -p ~/syncthing/config
PID=$(id -u) GID=$(id -g) docker compose up -d
