# ベースとなるOSイメージ
FROM centos:centos7

# 作成者
MAINTAINER harurunn

# [リポジトリ]
# yumを最新に
RUN yum -y update; yum clean all;
# epelリポジトリの追加
#RUN yum install -y epel-release
# epelリポジトリの優先度
#RUN sed -i -e'6s/enabled=1/enabled=0/g' /etc/yum.repos.d/epel.repo
# remiリポジトリの追加
#RUN yum -y install http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
# nginxリポジトリ
COPY nginx.repo /etc/yum.repos.d/

# [Nginx]
# 安定板nginxをインストール
RUN yum -y install --enablerepo=nginx nginx
# nginxのconf.defaultをリネーム
RUN mv /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf.origin
# nginxのconfをコピー
COPY centos7.conf /etc/nginx/conf.d/
# Webサーバで公開するディレクトリ
RUN mkdir /var/www
# htmlコピー
COPY index.php /var/www/

EXPOSE 80
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
