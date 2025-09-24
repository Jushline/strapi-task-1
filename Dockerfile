FROM node:18-alpine

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm ci --production

COPY . .

# build if using production build or set up runtime as needed
RUN npm run build

EXPOSE 1337
CMD ["npm", "start"]
