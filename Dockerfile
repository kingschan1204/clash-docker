FROM alpine:latest
COPY ./clash_pack /root/clash
WORKDIR /root/clash
RUN chmod +x ./clash ./clashcli && \
    mkdir -p /root/.config/clash && \
    cp Country.mmdb ~/.config/clash/ \
COPY ./config.yaml /root/.config/clash/
EXPOSE 9090/tcp
EXPOSE 7890/tcp 
ENTRYPOINT ./clash -f /root/.config/clash/config.yaml
