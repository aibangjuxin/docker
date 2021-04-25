FROM centos:7
MAINTAINER ALex@snsyr.com
RUN yum install -y gcc gcc-c++ make \
    openssl-devel pcre-devel gd-devel \
    iproute net-tools telnet wget curl && \
    yum clean all && \
    rm -rf /var/cache/yum/* && \
    mkdir /var/tmp/nginx
ADD nginx-1.14.1.tar.gz /var/tmp/nginx/
RUN cd /var/tmp/nginx && \
    #tar zxf nginx-1.14.1.tar.gz && \
    cd nginx-1.14.1 && \
    ./configure --prefix=/usr/local/nginx \
    --with-http_ssl_module \
    --with-http_realip_module \
    --with-threads \
    --with-stream \
    --with-stream_ssl_preread_module \
    --with-stream_ssl_module \
    --with-http_stub_status_module && \
    make -j 4 && make install && \
    rm -rf /usr/local/nginx/html/* && \
    echo "hello world" >> /usr/local/nginx/html/status.html && \
    cd / && rm -rf nginx-1.14.1*
ENV PATH $PATH:/usr/local/nginx/sbin
COPY nginx.conf /usr/local/nginx/conf/nginx.conf
WORKDIR /usr/local/nginx
EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]
