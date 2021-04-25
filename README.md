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
