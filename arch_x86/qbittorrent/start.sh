#!/usr/bin/env bash
mkdir -p ~/homepage/config
mkdir -p ~/syncthing/config
HOMEPAGE_CONFIG_DIR="$HOME/homepage/config" PID=$(id -u) GID=$(id -g) docker compose up -d
