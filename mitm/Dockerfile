FROM mitmproxy/mitmproxy

# 安装所需软件，并清理缓存
RUN apt-get update && \
    apt-get install -y iptables curl net-tools iproute2 && \
    rm -rf /var/lib/apt/lists/*

# 将启动脚本添加到容器中，并设置执行权限
COPY start.sh /start.sh
RUN chmod +x /start.sh

# 设置启动脚本为入口点
ENTRYPOINT ["/start.sh"]
