FROM nginx
MAINTAINER Ravi Huang <ravi.huang@gmail.com>

RUN apt-get -q update && apt-get -qy install dnsmasq wget iptables vim unzip \
    supervisor 
    
COPY conf/mime.types /etc/nginx/mime.types
COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY conf/default.conf /etc/nginx/conf.d/default.conf

COPY conf/dnsmasq.conf /etc/dnsmasq.conf
COPY conf/start.sh /start.sh

#for ssl
COPY conf/server.crt /etc/nginx
COPY conf/server_nopwd.key /etc/nginx

ONBUILD RUN rm -rf /var/lib/apt/lists/*
ENTRYPOINT ["/start.sh"]
CMD ["1.1.1.1"]

#RUN locale-gen en_US.UTF-8
#ENV LANG en_US.UTF-8
#ENV LANGUAGE en_US:en
#ENV LC_ALL en_US.UTF-8
