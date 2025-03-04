#!/usr/bin/env bash

mkdir -p $HOME/wireguard
mkdir -p $HOME/wireguard-ui

PID=$(id -u) GID=$(id -g) docker compose "$@"
