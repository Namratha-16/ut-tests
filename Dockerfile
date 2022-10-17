FROM --platform=linux/amd64 adoptopenjdk:openj9-bionic
LABEL maintainer="Zuhir Tanous"
ARG ssh_prv_key
ARG ssh_pub_key
# Install the bitbake dependencies
RUN dpkg --add-architecture i386
RUN apt-get dist-upgrade 
RUN apt-get update 
RUN apt-get -y upgrade
RUN apt-get install -y  gawk
RUN apt-get install -y wget 
RUN apt-get install -y git-core
RUN apt-get install -y diffstat 
RUN apt-get install -y unzip 
RUN apt-get install -y texinfo
RUN apt-get install -y gcc-multilib 
RUN apt-get install -y build-essential chrpath socat libsdl1.2-dev xterm cpio g++-multilib tmux \
     python3 iputils-ping locales debconf locales locales-all file time rsync \
     vim g++-multilib libssl-dev:i386 libcrypto++-dev:i386 zlib1g-dev:i386 \
     python-minimal python-pip
#RUN curl -OL https://github.com/Kitware/CMake/releases/download/v3.20.2/cmake-3.20.2.tar.gz
#RUN tar -zxvf cmake-3.20.2.tar.gz
#RUN cd cmake-3.20.2 &&  ./bootstrap -- -DCMAKE_USE_OPENSSL=OFF && make install
#RUN cmake --version
RUN apt-get update
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
RUN locale-gen && dpkg-reconfigure locales
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir pyyaml
ARG user=jenkins
ARG password=jenkins
ARG group=jenkins
ARG uid=1000
ARG gid=1000
ARG JENKINS_AGENT_HOME=/home/${user}
ENV JENKINS_AGENT_HOME ${JENKINS_AGENT_HOME}
RUN groupadd -g ${gid} ${group} \
    && useradd -d "${JENKINS_AGENT_HOME}" -u "${uid}" -g "${gid}" -m -s /bin/bash "${user}"
RUN mkdir "${JENKINS_AGENT_HOME}"/.ssh
# Add the keys and set permissions
RUN echo "$ssh_prv_key" > "${JENKINS_AGENT_HOME}"/.ssh/id_rsa && \
    echo "$ssh_pub_key" > "${JENKINS_AGENT_HOME}"/.ssh/id_rsa.pub && \
    chmod 600 "${JENKINS_AGENT_HOME}"/.ssh/id_rsa && \
    chmod 600 "${JENKINS_AGENT_HOME}"/.ssh/id_rsa.pub
RUN mkdir "${JENKINS_AGENT_HOME}"/certs
COPY certs/ /home/jenkins/certs/
RUN chown -R jenkins.jenkins "${JENKINS_AGENT_HOME}"/.ssh
#RUN yes '' | ssh-keygen -q -t rsa -N '' -f /home/jenkins/.ssh/id_rsa
#RUN touch .ssh/id_rsa.pub
# setup SSH server
RUN apt-get update \
    && apt-get install --no-install-recommends -y openssh-server \
    && rm -rf /var/lib/apt/lists/*
#RUN sed -i /etc/ssh/sshd_config \
USER ${user}
