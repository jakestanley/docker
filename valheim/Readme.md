# Links

[lloesche/valheim-server-docker on GitHub](https://github.com/lloesche/valheim-server-docker)

# Directory structure

```
Valheim
├── Player-prev.log
├── Player.log
├── adminlist.txt
├── backups
├── bannedlist.txt
├── characters
├── permittedlist.txt
├── prefs
└── worlds
ValheimBin
├── dl
└── server
```

Actually I don't think `Valheim/characters` is required.

# Environment

In `$HOME/valheim.env` add the following as per your liking

```
SERVER_NAME=my.cool.server.name
WORLD_NAME=myworld
SERVER_PASS=mypass
SERVER_PUBLIC=false
```

