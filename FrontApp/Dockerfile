# FrontApp Dockerfile

FROM node:9.2.0

ARG api_url=https://api.demo-aplose.osmose.xyz

WORKDIR /opt

RUN git clone --single-branch -b master https://github.com/Project-ODE/FrontApp

WORKDIR /opt/FrontApp

RUN npm install

RUN echo "REACT_APP_API_URL=$api_url/data.ode.org/v1" > .env.production.local

RUN npm run build
RUN npm install -g serve
