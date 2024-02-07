FROM mitmproxy/mitmproxy

# 替换为阿里云的APT源
RUN sed -i 's/deb.debian.org/mirrors.aliyun.com/g' /etc/apt/sources.list \
    && sed -i 's/security.debian.org/mirrors.aliyun.com/g' /etc/apt/sources.list

# 安装所需软件，并清理缓存
RUN apt-get update && \
    apt-get install -y curl iptables net-tools iproute2 tcpdump && \
    rm -rf /var/lib/apt/lists/*

# 将启动脚本添加到容器中，并设置执行权限
COPY start.sh /start.sh
RUN chmod +x /start.sh

# 设置启动脚本为入口点
ENTRYPOINT ["/start.sh"]
