# Use the official Node.js image as the base image
FROM node:24.0-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Set environment variables for production
ENV NODE_ENV=production
ENV VITE_APP_BACKEND_URL=http://localhost:3000

# Build the frontend application
RUN npm run build

# Use a lightweight web server to serve the built files
FROM nginx:stable-alpine3.21-perl


# Copy the built files to the Nginx web server directory
COPY --from=0 /app/dist /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
