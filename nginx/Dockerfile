# ODE Nginx Dockerfile
# Copyright (C) 2017 Project-EBDO

# author: Alexandre Degurse

FROM nginx:1.13.9

COPY config /etc/nginx

# If static files are served, add "/static" at the end of mkdir's path
RUN mkdir -p /var/www/ode && \
    chown -R www-data:www-data /var/www/ode

# Clone and set up projet with daemon's user
USER www-data

WORKDIR /var/www/ode

## Webapps or static files should be added here
#RUN git clone https://github.com/Project-EBDO/WEBAPP

USER root

CMD [ "nginx", "-g", "'daemon off;'" ]
