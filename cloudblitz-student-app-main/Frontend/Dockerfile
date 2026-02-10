# -------- Build Stage --------
FROM node:18-slim AS builder

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

# IMPORTANT: Make sure you already edited src/api/userService.js with your EC2 public IP
RUN npm run build

# -------- Serve Stage --------
FROM nginx:alpine

# Copy built files from Vite (dist folder)
COPY --from=builder /app/dist /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
