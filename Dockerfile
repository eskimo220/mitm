FROM mitmproxy/mitmproxy

# 安装 iptables
RUN apt-get update && apt-get install -y iptables curl net-tools

# 将启动脚本添加到容器中
COPY start.sh /start.sh

# 设置脚本可执行
RUN chmod +x /start.sh

# 设置启动脚本为入口点
ENTRYPOINT ["/start.sh"]
