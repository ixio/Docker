#!/bin/sh
# wait-for-pg.sh
# inspired by https://docs.docker.com/compose/startup-order/

set -e
host="$1"

until PGPASSWORD=$POSTGRES_PASSWORD psql -h "$host" -U "postgres" -c '\q'; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done
