# --- Build stage ---
FROM node:22-alpine AS build

WORKDIR /app

# Copy manifest first so npm ci is cached unless deps change
COPY package*.json ./
RUN npm ci

COPY . .

# Vite bakes env vars into the JS bundle at BUILD time, not at container
# runtime - so it must be passed as a build arg, not via --env-file later.
ARG VITE_API_URL
ENV VITE_API_URL=$VITE_API_URL

RUN npm run build

# --- Serve stage ---
FROM nginx:alpine

COPY --from=build /app/dist /usr/share/nginx/html

# nginx:alpine's default vhost listens on 80, not 88 - EXPOSE 88 before
# didn't change that, it just mislabeled the port.
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]