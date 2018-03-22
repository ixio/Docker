# ODE Nginx configuration

## Routes

In the default configuration, nginx:
- proxies all request made with a path that starts with data.ebdo.org to FeatureSerice

A commented location is present in nginx.conf that serves static files (css, js,
images, ...).

## Location of static files

Static files should be stored in /var/www/ode/static.

As frontend is not functionnal, there is no static files yet.

## Add a Webapp

A webapp can easily be added in the Dockerfile (there is a some
indications in the comments) and nginx config (an example location
is provided at the end of nginx.conf).

The idea is to put it in /var/www/ode/webapp_name during the creation of the
nginx image (via git clone, there are some indications in the comments of the
Dockerfile). Nginx must also be configured to serve this webapp. This is
done by adding a location such as this one:
```nginx
location /webapp_name {
   root /var/www/ode/webapp_name;
}
```
