#!/bin/sh

ip route del default
ip route add default via 10.121.0.2

sleep 3
curl -o /usr/local/share/ca-certificates/mitmproxy-ca-cert.crt http://mitm.it/cert/pem
update-ca-certificates

tail -f /dev/null
# 执行原始容器的命令
exec "$@"
