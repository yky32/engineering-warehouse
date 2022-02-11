#!/bin/bash
set -eo pipefail
IFS=$'\n\t'

CONTAINERS=$1
COMMAND=$2

ENV_CONTAINERS=("postgres")
DB_CONTAINERS=( "flyway" )
APP_CONTAINERS=( "api" )

BUCKET_NAME=""

if [ -z "$CONTAINERS" ] || [ -z "$COMMAND" ]; then
  echo "containers and command should be specified"
  exit -1
fi

case $CONTAINERS in
  env)
    for container in "${ENV_CONTAINERS[@]}" ; do
      if [ "$COMMAND" = "start" ] ; then
        echo "Starting container $container..."
        docker-compose -f docker/$container.yml up -d
      elif [ "$COMMAND" = "stop" ] ; then
        docker-compose -f docker/$container.yml kill
      else
        echo "$COMMAND command not supported. Available commands: start/stop"
        exit -1
      fi
    done
    ;;

  aws)
    if [ "$COMMAND" = "create" ] ; then
      if aws --endpoint-url=http://localhost:4572 s3api head-bucket --bucket $BUCKET_NAME 2>/dev/null; then
        echo "Bucket exists"
        echo ""
        echo "S3 List"
        echo "======="
        s3_list=`aws --endpoint-url=http://localhost:4572 s3 ls`
        echo "$s3_list"
      else
        echo "Creating bucket"
        aws --endpoint-url=http://localhost:4572 s3 mb s3://$BUCKET_NAME
        aws --endpoint-url=http://localhost:4572 s3api put-bucket-acl --bucket $BUCKET_NAME --acl public-read
      fi
      else
        echo "$COMMAND command not supported. Available commands: create"
        exit -1
      fi
    ;;

  db)
    for container in "${DB_CONTAINERS[@]}" ; do
      if [ "$COMMAND" = "clean" ] ; then
        echo "Starting container $container..."
        export FLYWAY="flyway:clean"
        docker-compose -f docker/$container.yml up
      elif [ "$COMMAND" = "migrate" ] ; then
        export FLYWAY="flyway:migrate"
        docker-compose -f docker/$container.yml up
      else
        echo "$COMMAND command not supported. Available commands: clean/migrate"
        exit -1
      fi
    done
    ;;
  app)
    for container in "${APP_CONTAINERS[@]}" ; do
      export GIT_SHORT_SHA=$(git rev-parse --short HEAD)
      if [ "$COMMAND" = "start" ] ; then
        echo "Starting container $container..."
        docker-compose -f docker/$container.yml up
      elif [ "$COMMAND" = "rebuild" ] ; then
        export FLYWAY="flyway:clean flyway:migrate"
        docker-compose -f docker/flyway.yml up
        docker-compose -f docker/api.yml up --build
      else
        echo "$COMMAND command not supported. Available commands: start/rebuild"
        exit -1
      fi
    done
    ;;

  *)
    echo "unknown containers"
    ;;
esac

