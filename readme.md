
- https://clash.wiki/ 详细介绍
- https://clash.gitbook.io/doc/restful-api/config api接口
- https://clash.wiki/runtime/external-controller.html api接口
- https://hub.docker.com/r/dreamacro/clash docker镜像地址
- http://clash.razord.top/#/proxies  管理界面


# 部署
```
docker build -t myclash:v1.18.0 .
mkdir -p /docker-data/myclash
# 挂载目录先将config.yaml和Country.mmdb复制到挂载目录，不然会覆盖镜像内的文件
docker run -d -p 29090:9090 -p 27890:7890  --name myclash  --restart=always -v /docker-data/myclash:/root/.config/clash/  myclash:v1.18.0

docker logs -f myclash

docker stop myclash && docker rm myclash && docker rmi myclash:v1.18.0

docker exec -it myclash sh

```








