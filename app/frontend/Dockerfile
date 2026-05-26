# --- STAGE 1: Build & Dependency Install ---
FROM node:18-alpine AS builder
WORKDIR /usr/src/app

# Copy package descriptors first to take advantage of Docker layer caching
COPY package*.json ./
RUN npm ci --only=production

# --- STAGE 2: Lightweight Runtime Isolation ---
FROM node:18-alpine
WORKDIR /usr/src/app

# Copy only runtime artifacts from the builder stage
COPY --from=builder /usr/src/app/node_modules ./node_modules
COPY . .

# Document that the application listens on port 80 inside the container
EXPOSE 80

# Configure execution command entrypoint
CMD ["npm", "start"]