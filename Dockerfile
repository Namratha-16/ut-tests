FROM adoptopenjdk:openj9-bionic

LABEL maintainer="Zuhir Tanous"
# Install the bitbake dependencies
RUN dpkg --add-architecture i386 \
    && apt-get dist-upgrade \
    && apt-get update \
    && apt-get -y upgrade
RUN apt-get install -y  gawk wget git-core diffstat unzip texinfo gcc-multilib \
     build-essential chrpath socat libsdl1.2-dev xterm cpio g++-multilib tmux \
     python3 iputils-ping locales debconf locales locales-all file time rsync \
     vim g++-multilib libssl-dev:i386 libcrypto++-dev:i386 zlib1g-dev:i386 \
     python-minimal python-pip
RUN curl -OL https://github.com/Kitware/CMake/releases/download/v3.20.2/cmake-3.20.2.tar.gz
RUN tar -zxvf cmake-3.20.2.tar.gz
RUN cd cmake-3.20.2 &&  ./bootstrap -- -DCMAKE_USE_OPENSSL=OFF && make install
RUN cmake --version
RUN apt-get update
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
RUN locale-gen && dpkg-reconfigure locales

RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir pyyaml

ARG user=jenkins
ARG group=jenkins
ARG uid=1000
ARG gid=1000
ARG JENKINS_AGENT_HOME=/home/${user}

ENV JENKINS_AGENT_HOME ${JENKINS_AGENT_HOME}

RUN groupadd -g ${gid} ${group} \
    && useradd -d "${JENKINS_AGENT_HOME}" -u "${uid}" -g "${gid}" -m -s /bin/bash "${user}"

# setup SSH server
RUN apt-get update \
    && apt-get install --no-install-recommends -y openssh-server \
    && rm -rf /var/lib/apt/lists/*
RUN sed -i /etc/ssh/sshd_config \
        -e 's/#PermitRootLogin.*/PermitRootLogin no/' \
        -e 's/#RSAAuthentication.*/RSAAuthentication yes \
	-e 's/#PasswordAuthentication.*/PasswordAuthentication no/' \
        -e 's/#SyslogFacility.*/SyslogFacility AUTH/' \
        -e 's/#LogLevel.*/LogLevel INFO/' && \
    mkdir /var/run/sshd && mkdir /work && mkdir /archive
RUN ln -s /usr/local/openjdk-11/bin/java /usr/local/bin/java
RUN touch /usr/bin/kt-success-notify && chmod a+x /usr/bin/kt-success-notify

RUN sed -i 's/mozilla\/DST_Root_CA_X3.crt/!mozilla\/DST_Root_CA_X3.crt/g' /etc/ca-certificates.conf
RUN update-ca-certificates

VOLUME "${JENKINS_AGENT_HOME}" "/tmp" "/run" "/var/run" "/work" "/archive"
WORKDIR "${JENKINS_AGENT_HOME}"

#COPY setup-sshd /usr/local/bin/setup-sshd

RUN echo "\nPATH=\"/opt/java/openjdk/bin:$PATH\"\n" >> /etc/profile
#COPY  ~/.ssh/ /home/jenkins
EXPOSE 22

#ENTRYPOINT ["setup-sshd"]



