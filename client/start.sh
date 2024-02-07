#!/bin/bash

mkdir /usr/local/share/ca-certificates/extra/
curl --proxy mitmproxy:8080 -o /usr/local/share/ca-certificates/extra/mitmproxy-ca-cert.crt http://mitm.it/cert/pem
update-ca-certificates

ip route del default
ip route add default via 10.121.0.2

# 执行原始容器的命令
exec "$@"
