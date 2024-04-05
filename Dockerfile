# Stage 1: Build the React application

# Use an official Node.js runtime as a parent image
FROM node:14 as builder

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json (or yarn.lock) files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of your app's source code
COPY . .

# Build your React app
RUN npm run build

# Stage 2: Serve the React application with Nginx

# Use an official Nginx runtime as a parent image
FROM nginx:alpine

# Copy the build output to replace the default Nginx contents
COPY --from=builder /app/build /usr/share/nginx/html

# Expose port 80 to the outside world
EXPOSE 80

# Start Nginx and keep it running in the foreground
CMD ["nginx", "-g", "daemon off;"]
