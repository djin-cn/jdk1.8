FROM centos:centos7.4.1708
MAINTAINER djin "273218159@qq.com"

USER root

RUN yum -y install java-1.8.0-openjdk.x86_64 && \
yum -y install java-1.8.0-openjdk-devel.x86_64 \
chmod u+x /etc/rc.d/rc.local && \
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

#ONBUILD ADD target/*-exc.jar  /home/
#ONBUILD echo 'nohup java -jar -Duser.timezone=GMT+08 \
-Dspring.profiles.active=server \
/home/*-exc.jar>/home/log 2>&1 &'>>/etc/rc.local
ENTRYPOINT ["/usr/sbin/init"]
