FROM node:18-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
# if you have a build step (for frontend/admin), run it:
RUN npm run build || true

EXPOSE 1337
CMD ["npm", "start"]
