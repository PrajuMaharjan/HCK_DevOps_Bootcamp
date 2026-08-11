#!/bin/bash
set -euo pipefail
# --- settings (same image you pushed in Script 1) --
USERNAME="prajumaharjan"
IMAGE="todo-backend"
TAG="latest"
FULL_NAME="$USERNAME/$IMAGE:$TAG"
# --- connection details --
KEY="cc.pem"
EC2_HOST="ec2-user@3.83.212.88"
echo "Deploying $FULL_NAME to $EC2_HOST ..."
# run all the deploy commands ON the server, over SSH
ssh -o StrictHostKeyChecking=accept-new -i "$KEY" "$EC2_HOST" "
  docker pull $FULL_NAME
  docker stop $CONTAINER 2>/dev/null || true
  docker rm $CONTAINER 2>/dev/null || true
  docker run -d --name $CONTAINER \
    --restart always -p 4200:4200 $FULL_NAME
"
echo "Deployed. App is live on port 4200."