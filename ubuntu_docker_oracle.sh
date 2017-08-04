# 安装docker
apt-get install docker.io

# 安装oracle
docker pull wnameless/oracle-xe-11g

# 运行docker下的oracle
 ###############################
 # 			              	
 # oracle数据库连接对应信息:	
 # 			              	
 # hostname:外网ip	              
 # 			        
 # port: 49161		        
 # 			        
 # sid: xe		        
 # 			        
 # username: system	        
 # 			        
 # password: oracle	        
 # 			        
 # SYS的密码: oracle    	
 #			        
 ###############################
docker run -h "oracle"  -d -p 49160:22 -p 49161:1521 -p 49162:8080 -e ORACLE_ALLOW_REMOTE=true wnameless/oracle-xe-11g

# 添加docker到开机启动
echo '#!/bin/bash\ndocker run -h "oracle"  -d -p 49160:22 -p 49161:1521 -p 49162:8080 -e ORACLE_ALLOW_REMOTE=true wnameless/oracle-xe-11g' > docker_oracle
chmod 755 docker_oracle
sudo mv docker_oracle /etc/init.d
cd /etc/init.d
sudo update-rc.d docker_oracle defaults 95
cd -

# 输出消息
cat message

# 卸载开机启动
# sudo update-rc.d -f docker_oracle remove

