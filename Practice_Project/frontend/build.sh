#!/bin/bash
set -euo pipefail

USERNAME="prajumaharjan"
IMAGE="todo-frontend"
TAG="latest"
FULL_NAME="$USERNAME/$IMAGE:$TAG"

# Where the built frontend should send API requests.
# Override at build time: VITE_API_URL=http://your-domain/api ./build.sh
VITE_API_URL="${VITE_API_URL:-http://54.157.210.144:5000/api}"

echo "Building $FULL_NAME with VITE_API_URL=$VITE_API_URL ..."
docker build --build-arg VITE_API_URL="$VITE_API_URL" -t "$FULL_NAME" .

echo "Pushing $FULL_NAME ..."
docker push "$FULL_NAME"

echo "Done. Image is live on Docker Hub."