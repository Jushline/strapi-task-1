FROM node:18-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install --omit=dev

COPY . .

# build if using production build or set up runtime as needed
RUN npm run build

EXPOSE 1337
CMD ["npm", "start"]
