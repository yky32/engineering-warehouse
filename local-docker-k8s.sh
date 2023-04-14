#!/bin/bash

DOCKER_USER=yky32 &&
SVC_NAME=user-auth-ext &&
echo $DOCKER_USER $SVC_NAME &&
docker build -t $SVC_NAME . &&
docker tag $SVC_NAME $DOCKER_USER/$SVC_NAME:latest &&
docker push $DOCKER_USER/$SVC_NAME &&
kubectl apply -f ./$SVC_NAME.yaml