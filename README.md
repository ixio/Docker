# EDO docker repository

The purpose of the repository is to gather all edo's sub projects and provide
way to use the whole project through docker compose.

### Requirements

To run the EDO project with docker, you need docker but also
docker-compose which isn't embeded with a default installation of docker.

#### Debian (Ubuntu and Debian derivatives)

Run the following commands to install docker and docker compose : 
```bash
sudo apt-get install docker
# and those two commands for docker compose
sudo curl -L https://github.com/docker/compose/releases/download/1.20.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```

See [here](https://docs.docker.com/compose/install/#install-compose) for more information.

### Run compose

To start the whole EDO architecture, run :
```bash
docker-compose up
```

If you want to start each part seperately, run :
```bash
docker-compose up <service>
```
where `<service>` can be feature_engine, feature_service, kibana, elasticsearch, nginx.

*Note: some services needs other services to work*
