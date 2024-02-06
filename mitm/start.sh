#!/bin/bash

# 在这里添加您想在启动时执行的命令
# 例如，定义 iptables 规则
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT --to-port 8080
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 443 -j REDIRECT --to-port 8080

# 执行原始容器的命令
exec "$@"
