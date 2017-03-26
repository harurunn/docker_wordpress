# 起動コマンド　docker run --privileged --name nginx -d imagename /sbin/init
# setting base image
FROM centos:centos7

# Author
MAINTAINER harurunn

# 更新
RUN yum -y update; yum clean all;
# epelリポジトリの追加
RUN yum install -y epel-release
# epelリポジトリの優先度
RUN sed '6s/enabled=1/enabled=0/g' /etc/yum.repos.d/epel.repo
# nginxリポジトリ
COPY nginx.repo /etc/yum.repos.d/
# 安定板nginxをインストール
RUN yum install nginx
# remiリポジトリの追加
RUN yum -y install http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
# php7とパッケージ類のインストール
RUN yum install -y --enablerepo=epel,remi-php70 php php-mbstring php-pear php-fpm php-mcrypt php-mysql

RUN

EXPOSE 80
