### 使用

添加软件源

```
curl -fsSL https://github.com/ekkog/openwrt-dist/raw/master/add-feed.sh | sh 
```

当前环境访问 GitHub 有问题时，可以使用 GitHub 镜像

```
curl -fsSL https://ghproxy.com/https://github.com/EkkoG/openwrt-dist/blob/master/add-feed.sh | sh
```

更新软件源并安装

```
opkg update
opkg install natmap
```
