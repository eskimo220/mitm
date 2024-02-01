#!/bin/bash

ip route del default
ip route add default via 172.121.0.2

# 执行原始容器的命令
exec "$@"