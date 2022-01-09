# docker

将需要的包直接放到工作目录下

# pwd

/root/docker

node2 root@node2:~/docker/nginx# pwd

/root/docker/nginx

node2 root@node2:~/docker/nginx# ls

Dockerfile  nginx-1.14.1.tar.gz  nginx.conf

注意：Dockerfile文件中不好包含空行，可能会warning

当然也可以在线wget需要的软件包

[WARNING]: Empty continuation lines will become errors in a future release


node2 root@node2:~# docker build -t centos:nginx /root/docker/nginx/


ping -f -c 100 www.baidu.com
PING www.a.shifen.com (14.215.177.38) 56(84) bytes of data.

--- www.a.shifen.com ping statistics ---
100 packets transmitted, 100 received, 0% packet loss, time 1446ms
rtt min/avg/max/mdev = 40.929/65.116/187.912/37.185 ms, pipe 13, ipg/ewma 14.606/42.619 ms


docker build -t ubuntu:tools /root/tool/
node1 root@node1:~# docker images
REPOSITORY                                        TAG                     IMAGE ID            CREATED             SIZE
ubuntu                                            tools                   fed5c746dbc8        44 seconds ago      529MB

about：
-i, --interactive                    Keep STDIN open even if not attached
-t, --tty                            Allocate a pseudo-TTY
-d, --detach                         Run container in background and print container ID
-p, --publish list                   Publish a container's port(s) to the host
--name string                    Assign a name to the container

# docker run -itd -p 8443:8443 --name=toolstest ubuntu:tools
f4164c5f309e613cb88cc0b1288480b24513de3a466704eecfee2384f07674fa

# docker ps
CONTAINER ID        IMAGE                                 COMMAND                  CREATED             STATUS                          PORTS                    NAMES
f4164c5f309e        ubuntu:tools                          "bash"                   54 seconds ago      Up 54 seconds                   0.0.0.0:8443->8443/tcp   toolstest

node1 root@node1:~# docker exec -it f4164c5f309e /bin/bash
node1 root@node1:~# docker exec -it f4164c5f309e /bin/bash
root@f4164c5f309e:/# uname -a
Linux f4164c5f309e 3.10.0-1127.el7.x86_64 #1 SMP Tue Mar 31 23:36:51 UTC 2020 x86_64 x86_64 x86_64 GNU/Linux
root@f4164c5f309e:/# cat /etc/issue
Ubuntu 20.04.3 LTS \n \l
