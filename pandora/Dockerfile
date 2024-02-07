FROM pengzhile/pandora-next

# 更新软件包索引并安装所需软件，然后清理缓存
RUN apk update && \
    apk add --no-cache curl iproute2 bind-tools ca-certificates && \
    rm -rf /var/cache/apk/*

# 将启动脚本添加到容器中，并设置执行权限
COPY start.sh /start.sh
RUN chmod +x /start.sh

# 设置启动脚本为入口点
ENTRYPOINT ["/start.sh"]
