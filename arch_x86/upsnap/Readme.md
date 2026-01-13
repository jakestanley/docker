# Set up "Sleep-on-LAN"

```
mkdir -p ssh
ssh-keygen -t ed25519 -f ssh/id_ed25519
```

## Copy SSH public key to Windows authorized keys
```
cat ssh/id_ed25519.pub | ssh mail@192.168.1.4 "cmd /c \"type >> %PROGRAMDATA%\\ssh\\administrators_authorized_keys\""
```

## Sleep command set up from UpSnap
```
ssh -i /.ssh/id_ed25519 mail@192.168.1.4 "rundll32.exe powrprof.dll,SetSuspendState 0,1,0"
```

### Host key verification error

Not recommended unless you're on a secure private network

```
ssh -i /.ssh/id_ed25519 -o "StrictHostKeyChecking=no" mail@192.168.1.4 "rundll32.exe powrprof.dll,SetSuspendState 0,1,0"
```
