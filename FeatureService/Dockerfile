# FeatureService Dockerfile

FROM node:10.18.1

ARG api_url=https://api.demo-aplose.osmose.xyz
ARG repo=https://github.com/Project-ODE/FeatureService
ARG branch=master

WORKDIR /opt

RUN git clone --single-branch -b $branch $repo

WORKDIR /opt/FeatureService

RUN npm install

ADD ./hyperswitch.patch /opt/FeatureService/hyperswitch.patch
RUN patch -p0 < hyperswitch.patch

RUN touch htpasswd && \
    cp config.test.yaml config.yaml && \
    sed -i "s|1h|40d|g" config.yaml && \
    sed -i "s|http://localhost:7231|$api_url|g" config.yaml && \
    sed -i "s|connection: {|connection: {\n            host: 'db',|g" knexfile.js

RUN ln -s /opt/FeatureService/node_modules/knex/bin/cli.js /usr/bin/knex

EXPOSE 7231
