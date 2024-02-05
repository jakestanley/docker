#!/usr/bin/env bash
CONFIG_DIR=$HOME/.config/com.github.jakestanley.docker
mkdir -p $CONFIG_DIR
mkdir -p $HOME/rust

ENV_FILE=$CONFIG_DIR/rust.env
touch $ENV_FILE

prompt() {
    read -s -p "Enter the desired RCON password for the server" rcon_password
    echo "RUST_RCON_PASSWORD=$rcon_password" >> $ENV_FILE
}

if grep -q "^RUST_RCON_PASSWORD=" "$ENV_FILE"; then
    echo "Password is set"
else
    prompt
fi
    
docker run --name rust-server \
	-p 28015:28015 \
	-p 28015:28015/udp \
	-p 8082:8080 \
	-e RUST_SERVER_NAME=Stanners \
	-e RUST_SERVER_WORLDSIZE=3500 \
	--env-file $ENV_FILE \
	-v $HOME/rust:/steamcmd/rust \
	didstopia/rust-server 
