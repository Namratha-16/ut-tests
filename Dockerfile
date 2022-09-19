FROM adoptopenjdk:openj9-bionic



LABEL maintainer="Zuhir Tanous"
# Install the bitbake dependencies
RUN dpkg --add-architecture i386 \
    && apt-get dist-upgrade \
    && apt-get update \
    && apt-get -y upgrade
