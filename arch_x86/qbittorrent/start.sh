#!/usr/bin/env bash
mkdir -p ~/homepage/config
PID=$(id -u) GID=$(id -g) docker compose up -d
