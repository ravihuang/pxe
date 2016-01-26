# PXE  
Docker Container for PXE Server, Support CentOS, Ubuntu, Freebsd, Debian, CoreOS, Panabit

##Build Images:
[root@docker ~]# cd pxe && docker build -t ravihuang/pxe .

##Start container:
```
[root@docker ~]# cat /etc/system-release
CentOS Linux release 7.2.1511 (Core)
[root@docker ~]# ls /mnt/hgfs/tftpboot/ -l
total 1183590
-rwxrwxrwx 1 root root         84 Jan 15  2013 boot.msg
drwxrwxrwx 1 root root       4096 Jan 21 23:42 centos
drwxrwxrwx 1 root root       8192 Jan 25 11:13 coreos
drwxrwxrwx 1 root root          0 Sep 11 11:30 debian
drwxrwxrwx 1 root root          0 Sep  9  2013 freebsd
drwxrwxrwx 1 root root          0 Aug  7  2013 freebsd.panabit
-rwxrwxrwx 1 root root        142 Jan 15  2013 grub.conf
-rwxrwxrwx 1 root root      24576 Jan 15  2013 isolinux.bin
-rwxrwxrwx 1 root root     165080 Jan 15  2013 memtest
-rwxrwxrwx 1 root root     264192 Aug  7  2013 pxeboot
-rwxrwxrwx 1 root root      26582 Nov 15  2012 pxelinux.0
drwxrwxrwx 1 root root          0 Aug  1  2014 pxelinux.cfg
-rwxrwxrwx 1 root root     151230 Jan 15  2013 splash.jpg
drwxrwxrwx 1 root root       4096 Jun  6  2014 ubuntu
-rwxrwxrwx 1 root root     162860 Jan 15  2013 vesamenu.c32

[root@docker ~]# docker run --name pxe2  --net host -v /mnt/hgfs/tftpboot:/tftpboot -v /mnt/cdrom:/mnt/cdrom -d ravihuang/pxe 192.168.103.11
```
192.168.103.11 is dhcp listen address
