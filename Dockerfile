FROM ubuntu:jammy

WORKDIR /root

RUN /bin/bash -c 'apt update; \
apt install curl openjdk-8-jre-headless -y'

RUN /bin/bash -c 'curl https://dlcdn.apache.org/zookeeper/zookeeper-3.6.3/apache-zookeeper-3.6.3-bin.tar.gz --output zookeeper.tar.gz; \ 
tar xvf zookeeper.tar.gz -C /root'

EXPOSE 2181

WORKDIR /root/apache-zookeeper-3.6.3-bin

CMD bin/zkServer.sh --config conf start