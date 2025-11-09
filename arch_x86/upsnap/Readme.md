# Set up "Sleep-on-LAN"

mkdir -p ssh
ssh-keygen -t ed25519 -f ssh/id_ed25519

## Sleep command set up from UpSnap
ssh -i /.ssh/id_ed25519 mail@192.168.1.4 "rundll32.exe powrprof.dll,SetSuspendState 0,1,0"
