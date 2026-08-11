FROM node:22-alpine as build

WORKDIR /app

COPY . .

RUN npm install

EXPOSE 5173

RUN npm run build

FROM nginx:alpine

COPY --from=build /app/dist /usr/share/nginx/html

EXPOSE 88

CMD ["nginx","-g","daemon off;"]