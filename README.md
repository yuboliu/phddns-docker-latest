# phddns
docker部署花生壳5.2
### Usage

```sh
# docker容器使用host网络模型，由于花生壳的SN号是基于MAC地址计算的，避免花生壳的SN号发生变化，在容器启动时候指定MAC地址。在通过docker-compose运行oray.yml的时候需替换文件中的mac_address: 00:0c:29:59:cb:04，替换需注意00:0C:29的MAC OUI不能改变。
sudo docker build -t oray:5.2 . # 通过docker file build 镜像
sudo docker-compose -f oray.yml up -d # 通过docker-compose 运行镜像
sudo docker exec oray phddns status # 查看花生壳SN号
```

### 引用

- [花生壳下载](https://hsk.oray.com/download)
- [MAC随机生成](https://www.jisuan.mobi/gXr.html)
