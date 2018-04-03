# ODE FeatureEngine Dockerfile
# Copyright (C) 2017 Project-ODE

# author: Alexandre Degurse

FROM node:6

RUN mkdir /opt/feature_service && \
    chown node:node /opt/feature_service

# Clone and set up projet with daemon's user
USER node

WORKDIR /opt

RUN git clone https://github.com/Project-ODE/FeatureService.git feature_service

WORKDIR /opt/feature_service

# Install all FeatureSerive's dependencies
RUN npm install

# run with example configuration file and set up authentification
# and the localtion of Elasticsearch on it.
RUN \
    touch /opt/feature_service/htpasswd && \
    cp config.example.yaml config.yaml && \
    sed -i 's/your\/htpasswd\/file\/path/opt\/feature_service\/htpasswd/' config.yaml && \
    sed -i 's/localhost/elasticsearch/' config.yaml && \
    sed -i "s/GENERATE NEW SECRET PLEASE/`cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 128 | head -n 1`/" config.yaml

CMD [ "node", "server.js" ]
