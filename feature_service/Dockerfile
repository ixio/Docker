# FeatureEngine Dockerfile

FROM node:6

# Clone and set up projet with daemon's user
USER node

WORKDIR /home/node

RUN git clone https://github.com/Project-EBDO/FeatureService.git

WORKDIR /home/node/FeatureService

# Install all FeatureSerive's dependencies
RUN npm install

# run with example configuration file and set up authentification
# and the localtion of Elasticsearch on it.
RUN \
    touch /home/node/htpasswd && \
    cp config.example.yaml config.yaml && \
    sed -i 's/your\/htpasswd\/file\/path/home\/node\/htpasswd/' config.yaml && \
    sed -i 's/localhost/elasticsearch/' config.yaml && \
    sed -i 's/GENERATE NEW SECRET PLEASE/secret/' config.yaml