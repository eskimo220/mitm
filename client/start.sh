#!/bin/bash

ip route del default
ip route add default via 10.121.0.2

mkdir /usr/local/share/ca-certificates/extra/
sleep 5
curl -o /usr/local/share/ca-certificates/extra/mitmproxy-ca-cert.crt http://mitm.it/cert/pem
update-ca-certificates

# 执行原始容器的命令
exec "$@"
