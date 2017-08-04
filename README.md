# ubuntu_docker_oracle

## 简介
Ubuntu 16.04.3 LTS 上运行，使用docker安装与配置允许外网访问的oracle数据库脚本。

## 安装
```
sudo sh ubuntu_docker_oracle.sh
```

## 使用方法

### 开启oracle虚拟机
- 执行脚本后自动启动，并开启开机自动启动
- 手动开启：
```
sudo docker start oracle
```

### 查看虚拟机运行状态
```
sudo docker ps
```

### 本地登录oracle虚拟机
```
sudo docker exec -it oracle /bin/bash
```

### 连接数据库
- 本地连接
```
 ################################
 #                              #
 # oracle数据库连接对应信息:       #
 #                              #
 # hostname:localhost           #
 #                              #
 # port: 49161                  #
 #                              #
 # sid: xe                      #
 #                              #
 # username: system             #
 #                              #
 # password: oracle             #
 #                              #
 # SYS的密码: oracle             #
 #                              #
 ################################ 
```
- 远程连接:将`hostname`换为外网ip

### 关闭数据库
```
sudo docker kill oracle
```
### 关闭数据库开机启动
```
sudo update-rc.d -f docker_oracle remove
```
