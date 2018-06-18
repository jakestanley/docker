#!/usr/bin/env bash



sudo mkdir -p /var/media
sudo mkdir -p /var/httpd
sudo mkdir -p /var/cloud/{config,data}
sudo mkdir -p /var/factorio
sudo mkdir -p /var/minecraft

sudo chown -R $USER:$USER /var/media
sudo chown -R $USER:$USER /var/httpd
sudo chown -R $USER:$USER /var/cloud
sudo chown -R $USER:$USER /var/factorio
sudo chown -R $USER:$USER /var/minecraft

