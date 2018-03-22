# ODE docker repository

The purpose of this repository is to provide [docker](https://docker.com)
configuration to tie-up together the various components of the ODE platform
through a single docker-compose command.

### Requirements

You need to install docker and docker-compose:

Theoretically:
- docker 1.13+
- docker-compose 1.10+

The platform had been tested with :
- docker 18.02.0-ce
- docker-compose 1.19.0

#### Ubuntu and Debian

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

### Run the platform

First, get this code by cloning or downloading this repository. Then, move into its main folder.


To start the whole thing, run:
```bash
docker-compose up
```

For starting each container separately:
```bash
docker-compose up <service>
#where `<service>` can be feature_engine, feature_service, kibana, elasticsearch, nginx.
```

*Note: some services depends on other services to work*
