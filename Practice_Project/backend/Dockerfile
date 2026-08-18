FROM node:22-alpine

WORKDIR /app

# Copy only manifest files first so npm ci is cached unless deps actually change
COPY package*.json ./
RUN npm ci --omit=dev

# Now copy the rest of the source
COPY . .

EXPOSE 5000

CMD ["node", "server.js"]