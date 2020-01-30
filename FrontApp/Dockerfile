# FrontApp Dockerfile

FROM node:9.2.0

ARG api_url=https://api.demo-aplose.osmose.xyz
ARG repo=https://github.com/Project-ODE/FrontApp
ARG branch=master

WORKDIR /opt

RUN git clone --single-branch -b $branch $repo

WORKDIR /opt/FrontApp

RUN npm install

RUN echo "REACT_APP_API_URL=$api_url/data.ode.org/v1" > .env.production.local

RUN npm run build
RUN npm install -g serve
