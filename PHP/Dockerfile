# ベースとなるOSイメージ
FROM centos:centos7

# 作成者
MAINTAINER harurunn

# [リポジトリ]
# yumを最新に
RUN yum -y update; yum clean all;
# epelリポジトリの追加
RUN yum install -y epel-release
# epelリポジトリの優先度
RUN sed -i -e'6s/enabled=1/enabled=0/g' /etc/yum.repos.d/epel.repo
# remiリポジトリの追加
RUN yum -y install http://rpms.famillecollet.com/enterprise/remi-release-7.rpm

# [PHP]
# php7とパッケージ類のインストール
RUN yum install -y --enablerepo=epel,remi-php70 php php-mbstring php-pear php-fpm php-mcrypt php-mysql
# php-fpm エラーファイル生成
RUN mkdir -p /var/log/php-fpm
RUN touch /var/log/php-fpm/www-error.log
# www.confをapacheからnginxに
RUN sed -i -e '24s/user = apache/user = nginx/g' /etc/php-fpm.d/www.conf &&\
    sed -i -e '26s/group = apache/group = nginx/g' /etc/php-fpm.d/www.conf
# リネーム
RUN mv /etc/php.ini /etc/php.ini.origin
# php.iniをコピー
COPY php.ini /etc/

EXPOSE 80
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
