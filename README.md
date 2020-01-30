# ODE docker repository

The purpose of this repository is to provide a [Docker](https://docker.com) configuration to tie-up together the various components of the ODE platform through a single docker-compose command.

## Requirements

You need to install docker and docker-compose:

Theoretically:
- docker 1.13+
- docker-compose 1.10+

The platform had been tested with :
- docker 18.02.0-ce
- docker-compose 1.19.0

### Ubuntu and Debian

Docker should be installed by using docker's repository.
Run the following commands to install docker-ce and docker compose :
```bash
sudo apt-get update
sudo apt-get install curl gnupg2 apt-transport-https ca-certificates software-properties-common

# Run these two commands for debian
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"

# and these two for ubuntu
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt-get install docker-ce
sudo curl -L https://github.com/docker/compose/releases/download/1.20.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```

See [the docker official installation documentation](https://docs.docker.com/install/)
and [the docker-compose official installation documentation](https://docs.docker.com/documentation/compose/install/#install-compose)
for more information.

## Run the platform

First, get this code by cloning or downloading this repository. Then, move into its main folder.


To start the whole thing, run:
```bash
docker-compose up
```

For starting each container separately:
```bash
docker-compose up <service>
#where `<service>` can be front_app, feature_service, ...
```

Initial set-up for FeatureService will be slow as default config is to run seeding that downloads a lot of files, when re-running the container it will skip files it has already downloaded.

You can change which branch or repo is used by modifying the .env file.

*Note: some services depends on other services to work*

### Running on a server

You should change the API_URL to the correct host name in the .env file (https://api.aplose.osmose.xyz for example). You should also use a reverse-proxy all-in-one solution like [Traefik](https://github.com/containous/traefik) or [HTTPS-PORTAL](https://github.com/SteveLTN/https-portal). A docker-compose.yaml example with HTTPS-PORTAL:

```
https-portal:
  image: steveltn/https-portal:1
  ports:
    - '80:80'
    - '443:443'
  restart: always
  volumes:
    - /root/https-portal-vhosts:/var/www/vhosts:ro
  environment:
    DOMAINS: aplose.osmose.xyz -> http://dockerhost:5000, api.osmose.ixio.xyz -> http://dockerhost:7231
    STAGE: 'production'
```

#### Demo update script: update-demo.sh

The update-demo.sh script is meant to be used with a crontab to keep an up-to-date demo on the web and / or a staging environment. It records in a html comment on FrontApp the different commits used so that advanced users can know what is deployed exactly.

### Use custom FeatureService seeding

You can un-comment volumes line in the docker-compose file if you use your own seeding files.
