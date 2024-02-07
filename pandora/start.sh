#!/bin/sh

sleep 3
curl --proxy mitmproxy:8080 -o /usr/local/share/ca-certificates/mitmproxy-ca-cert.crt http://mitm.it/cert/pem
update-ca-certificates

ip route del default
ip route add default via 10.121.0.2
tail -f /dev/null
# 执行原始容器的命令
exec "$@"
