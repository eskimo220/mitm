FROM ubuntu:latest

# 更换为阿里云镜像源
RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list && \
    sed -i 's/security.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list

# 安装所需软件，并清理缓存
RUN apt-get update && \
    apt-get install -y curl iproute2 dnsutils ca-certificates tcpdump && \
    rm -rf /var/lib/apt/lists/*

# 将启动脚本和证书添加到容器中，并设置权限
COPY start.sh /start.sh
COPY ./mitmproxy-ca-cert.crt /usr/local/share/ca-certificates/extra/
RUN chmod +x /start.sh && \
    update-ca-certificates

# 配置工作环境
WORKDIR /app

# 设置启动脚本为入口点
ENTRYPOINT ["/start.sh"]

# 保持容器运行
CMD ["tail", "-f", "/dev/null"]
