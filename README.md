# ubuntu_docker_oracle

## 简介
Ubuntu 16.04.3 LTS 上运行，使用docker安装与配置允许外网访问的oracle数据库脚本。

## 安装
```
sudo sh ubuntu_docker_oracle.sh
```

## 使用方法

### 开启数据库
- 执行脚本后自动启动，并开启开机自动启动
- 手动开启：
```
sudo docker run -h "oracle"  -d -p 49160:22 -p 49161:1521 -p 49162:8080 -e ORACLE_ALLOW_REMOTE=true wnameless/oracle-xe-11g
```

### 查看运行状态
```
sudo docker ps
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
- 远程连接
 将`hostname`换为外网ip

### 关闭数据库
- `sudo docker ps`查看运行状态
    ```
    CONTAINER ID        IMAGE                     COMMAND                  CREATED              STATUS              PORTS                                                                     NAMES
    cab518c9428f        wnameless/oracle-xe-11g   "/bin/sh -c '/usr/sbi"   About a minute ago   Up About a minute   0.0.0.0:49160->22/tcp, 0.0.0.0:49161->1521/tcp, 0.0.0.0:49162->8080/tcp   small_goodall
    ```
- `sudo docker kill IMAGES_NAMES`将`IMAGES_NAMES`换为运行状态的值，演示中是`small_goodall`

### 关闭数据库开机启动
```
sudo update-rc.d -f docker_oracle remove
```
