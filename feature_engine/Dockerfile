# Scala and sbt Dockerfile

# Pull base image
FROM debian:9

# install scala
RUN \
  apt-get -y update && \
  apt-get -y install openjdk-8-jdk scala gnupg apt-transport-https git

# install sbt
RUN \
  echo "deb https://dl.bintray.com/sbt/debian /" >> /etc/apt/sources.list &&\
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823 && \
  apt-get -y update && \
  apt-get -y install sbt


WORKDIR /root

RUN git clone https://github.com/Project-EBDO/FeatureEngine.git

WORKDIR /root/FeatureEngine

# compile in order to download depencies as well
RUN sbt compile
