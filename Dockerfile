# Use official Node.js base image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package files first (better caching)
COPY package.json package-lock.json* yarn.lock* ./

# Install dependencies (including pg for Postgres)
RUN npm install --production && npm install pg --save

# Copy rest of the project
COPY . .

# Build Strapi admin panel (optional, improves prod startup)
RUN npm run build

# Expose Strapi port
EXPOSE 1337

# Start Strapi
CMD ["npm", "start"]
