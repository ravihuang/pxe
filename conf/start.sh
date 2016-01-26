#!/bin/bash
set -x

ip=$1

STATUS=`grep $ip /etc/dnsmasq.conf`
if [ $? -eq 1 ]; then
   echo "Set DHCP IP/Range:"
   prefix=${ip%.*}
   sed -i "s/localaddr/$ip/g" /etc/dnsmasq.conf
   sed -i "s/netaddr/$prefix/g"  /etc/dnsmasq.conf
fi

echo "$ip pxe.ravihuang.net" >> /etc/hosts
echo "Start Services:"
service nginx start
exec dnsmasq --no-daemon

