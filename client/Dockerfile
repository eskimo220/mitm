FROM ubuntu:latest

# 安装所需软件，并清理缓存
RUN apt-get update && \
    apt-get install -y curl iproute2 ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# 将启动脚本和证书添加到容器中，并设置权限
COPY start.sh /start.sh
COPY ./mitmproxy-ca-cert.crt /usr/local/share/ca-certificates/
RUN chmod +x /start.sh && \
    update-ca-certificates

# 配置工作环境
WORKDIR /app

# 设置启动脚本为入口点
ENTRYPOINT ["/start.sh"]

# 保持容器运行
CMD ["tail", "-f", "/dev/null"]
