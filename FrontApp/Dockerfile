# FrontApp Dockerfile

FROM node:9.2.0

WORKDIR /opt

RUN git clone --single-branch -b master https://github.com/Project-ODE/FrontApp

WORKDIR /opt/FrontApp

RUN npm install

RUN echo "REACT_APP_API_URL=https://api.osmose.ixio.xyz/data.ode.org/v1" > .env.production.local

RUN npm run build
RUN npm install -g serve
