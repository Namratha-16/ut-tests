############################################################
# Dockerfile to build yocto build environment image
# Based on Ubuntu 20.04
############################################################
FROM ubuntu:20.04
LABEL maintainer="Zuhir Tanous"
ENV DEBIAN_FRONTEND=noninteractive 
RUN dpkg --add-architecture i386 \
   && apt-get dist-upgrade \
   && apt-get update \
   && apt-get -y upgrade
RUN apt-get install -y
RUN gawk 
RUN wget git diffstat unzip texinfo gcc build-essential chrpath socat cpio \
    python python3 python3-pip python3-pexpect python3-git python3-jinja2 pylint3 python3-subunit \
    xz-utils debianutils iputils-ping xterm libegl1-mesa mesa-common-dev zstd
# ENV LC_ALL en_US.UTF-8
# ENV LANG en_US.UTF-8
RUN apt-get install -y locales
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen
ENV LC_ALL en_US.UTF-8 
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en 
RUN dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=$LANG

# qmake does not show problem but we can do:
# RUN apt-get install qtbase5-dev qttools5-dev-tools qt5-default

WORKDIR "/work"
