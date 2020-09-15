# phddns
docker部署花生壳5.0
### Usage

```sh
# 花生壳5.0用到了systemctl,只能这么干了,虽然有点蠢
# 这个mac地址替换为宿主机网卡的mac
docker run --name phddns --privileged -d --restart=always --mac-address 92:d0:c6:0a:29:33 laiqe/phddns /sbin/init
docker exec -d phddns bash -c "/run.sh > log.txt"
docker exec phddns cat /log.txt
```

### 引用

- [花生壳下载](https://hsk.oray.com/download)
