FROM node:18-alpine

WORKDIR /app

# install dependencies (copy package files first to leverage layer cache)
COPY package*.json ./
RUN npm install


# copy source
COPY . .

EXPOSE 1337

# default command for development (Strapi's dev server)
CMD ["npm", "run", "develop"]
