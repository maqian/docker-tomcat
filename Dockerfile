FROM tomcat:8.5

COPY sources.list.d/* /etc/apt/sources.list.d/

RUN rm -rf /etc/apt/source.list /etc/apt/sources.list.d/jessie-backports.list /etc/apt/sources.list.d/unstable.list \
  && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 40976EAF437D05B5 3B4FE6ACC0B21F32 \
  && apt-get update \
  && apt-get -y install language-pack-zh-hans \
  && sed -i 's/# zh_CN.UTF-8 UTF-8/zh_CN.UTF-8 UTF-8/g' /etc/locale.gen \
  && locale-gen \
  && echo LC_ALL="zh_CN.UTF-8" >> /etc/environment \
  && echo LANG="zh_CN.UTF-8" >> /etc/environment \
  && echo LANGUAGE="zh_CN.UTF-8:zh:en_US:en" >> /etc/environment \
  && echo "Asia/Shanghai" > /etc/timezone \
  && "cp" -f /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

ENV TIMEZONE=Asia/Shanghai LANG=zh_CN.UTF-8 LC_ALL=zh_CN.UTF-8 LANGUAGE=zh_CN.UTF-8:zh:en_US:en
