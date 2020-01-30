#!/bin/bash

# STEP 1
# Let's update our project images & containers
docker-compose build --no-cache front_app feature_service
docker-compose up -d --force-recreate

# STEP 2
# Let's record in FrontApp the current project commits
FS_COMMIT=`docker-compose exec feature_service git log -1 --no-color`
FA_COMMIT=`docker-compose exec front_app git log -1 --no-color`

MSG="
<!--
Welcome to APLOSE demo !

FeatureService: $FS_COMMIT

FrontApp: $FA_COMMIT
-->
"

FRONT_APP=`docker-compose ps -q front_app`
printf "$MSG" > /tmp/tmp.html
docker cp /tmp/tmp.html $FRONT_APP:/tmp/comments_footer.html
rm /tmp/tmp.html
docker-compose exec front_app bash -c 'cat /tmp/comments_footer.html >> ./build/index.html'
docker-compose restart front_app
