# wg-config (needed to get wireguard going)

Adapted from this guide: https://tongkl.com/wireguard-qbittorrent-ipv6/

You'll need to add these lines to your wg0.conf under `[Interface]`. Assuming your subnet is on 192.168.1.0

```
PostUp = sh -c 'DROUTE=$(ip route | grep default | awk "{print \$3}"); HOMENET=192.168.0.0/16; HOMENET2=172.16.0.0/12; ip route add $HOMENET via $DROUTE; ip route add $HOMENET2 via $DROUTE; iptables -I OUTPUT -d $HOMENET -j ACCEPT; iptables -I OUTPUT -d $HOMENET2 -j ACCEPT; iptables -A OUTPUT ! -o %i -m mark ! --mark $(wg show %i fwmark) -m addrtype ! --dst-type LOCAL -j REJECT'

PreDown = sh -c 'HOMENET=192.168.0.0/16; HOMENET2=172.16.0.0/12; ip route delete $HOMENET; ip route delete $HOMENET2; iptables -D OUTPUT ! -o %i -m mark ! --mark $(wg show %i fwmark) -m addrtype ! --dst-type LOCAL -j REJECT; iptables -D OUTPUT -d $HOMENET -j ACCEPT; iptables -D OUTPUT -d $HOMENET2 -j ACCEPT'
```

# One liner
mkdir ~/pirateget && docker compose up --build -d

# Optional QoL adjustments
- add an alias to qbit-add.sh

