# Raspberry Pi Docker Stuff

docker based:
- torrenting via private internet access VPN tunnel
- media server via plex
- other stuff

## Pre-requisites

based on my set up. YMMV.

- raspberry pi 3
- raspbian stretch
- git
- this repository checked out at `~/docker`
- docker-ce 17.09

## Installing Docker

install docker-ce 17.09.0 as it seems to work

- install docker-ce `sudo apt-get install -y docker-ce=17.09.0~ce-0~raspbian`
- add yourself to the docker group `sudo gpasswd -a $(whoami) docker`
- `sudo systemctl enable docker`
- `sudo systemctl start docker`

## Private Internet Access and Deluge bundle

- `git clone https://github.com/Bantam/docker-piavpn-arm.git`
- `cd docker-piavpn-arm`
- i'm not sure about the following build command but you get the rough idea. **update this next time**
- `docker build -t bantam/docker-piavpn-arm -f Dockerfile`
- run the piavpn.bash script
- when downloading, download to `/torrents/` - this can be made permanent in settings

### Configuring Deluge

- Install Label plugin
- Install [AutoAdd plugin](https://github.com/gazpachoking/deluge-autoadd-plugin/downloads)

## other docker scripts

these are plug and play at the time of writing

- docker ui
- minecraft server
- plex

## docker compose

### morpheus

Provisions docker environment for my VPS.

### orac

Provisions docker environment for the Raspberry pi running on my home network.

