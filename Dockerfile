FROM centos
MAINTAINER CHITHANYA
LABEL This is for docker-compose to build image
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum update -y && yum -y install httpd
EXPOSE 80
CMD ["/usr/sbin/httpd","-D","FOREGROUND"]
