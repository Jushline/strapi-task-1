FROM node:18-alpine

WORKDIR /app

COPY package*.json ./

# install production dependencies only
RUN npm install --omit=dev

COPY . .

# build if Strapi project has a build step (optional)
RUN npm run build || echo "no build step"

EXPOSE 1337
CMD ["npm", "run", "start"]
