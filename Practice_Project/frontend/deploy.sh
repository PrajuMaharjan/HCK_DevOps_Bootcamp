#!/bin/bash
set -euo pipefail

USERNAME="prajumaharjan"
IMAGE="todo-frontend"
TAG="latest"
FULL_NAME="$USERNAME/$IMAGE:$TAG"

CONTAINER="todo-frontend"
HOST_PORT=80        # public-facing port for the site
CONTAINER_PORT=80   # nginx's default listen port inside the image

KEY="cc.pem"
EC2_HOST="ec2-user@54.157.210.144"

echo "Deploying $FULL_NAME to $EC2_HOST ..."

ssh -o StrictHostKeyChecking=accept-new -i "$KEY" "$EC2_HOST" "
  docker pull $FULL_NAME
  docker stop $CONTAINER 2>/dev/null || true
  docker rm $CONTAINER 2>/dev/null || true
  docker run -d --name $CONTAINER \
    --restart unless-stopped \
    -p $HOST_PORT:$CONTAINER_PORT \
    $FULL_NAME
"

echo "Deployed. App is live on http://<ec2-host>:$HOST_PORT"