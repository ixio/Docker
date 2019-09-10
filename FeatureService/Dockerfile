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
    sed -i "s/port: 5433/port: 5432,\n            host: 'testdb'/" knexfile.js

RUN ln -s /opt/FeatureService/node_modules/knex/bin/cli.js /usr/bin/knex

COPY data/*.wav resources/annotator/wav/
COPY data/*.png resources/annotator/png/
COPY data/init.js db/seeds/test/

EXPOSE 7231
