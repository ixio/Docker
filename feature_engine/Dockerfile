# ODE Scala and sbt Dockerfile
# Copyright (C) 2017 Project-ODE

# author: Alexandre Degurse

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


WORKDIR /opt

RUN git clone https://github.com/Project-ODE/FeatureEngine.git feature_engine

WORKDIR /opt/feature_engine

# compile in order to download depencies as well
RUN sbt compile
