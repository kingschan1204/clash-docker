FROM alpine:latest
# 设置时区为东八区
ENV TZ Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime > /etc/timezone
# copy命令只有在Dockerfile目录下才生效
COPY ./clash_pack /root/clash
RUN chmod +x /root/clash/clash
RUN mkdir -p /root/.config/clash
RUN cp /root/clash/Country.mmdb ~/.config/clash/
COPY ./config.yaml /root/.config/clash/
EXPOSE 9090/tcp
EXPOSE 7890/tcp
ENTRYPOINT ["/root/clash/clash","-d","/root/.config/clash/"]
