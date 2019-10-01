# FeatureService Dockerfile

FROM node:9.2.0

WORKDIR /opt

RUN git clone --single-branch -b master https://github.com/Project-ODE/FeatureService

WORKDIR /opt/FeatureService

RUN npm install

ADD ./hyperswitch.patch /opt/FeatureService/hyperswitch.patch
RUN patch -p0 < hyperswitch.patch

RUN touch htpasswd && \
    cp config.test.yaml config.yaml && \
    sed -i "s/1h/40d/g" config.yaml && \
    sed -i "s/http:\/\/localhost:7231/https:\/\/api.osmose.ixio.xyz/g" config.yaml && \
    sed -i "s/port: 5433/port: 5433,\n            host: 'db'/" knexfile.js

RUN ln -s /opt/FeatureService/node_modules/knex/bin/cli.js /usr/bin/knex

EXPOSE 7231
