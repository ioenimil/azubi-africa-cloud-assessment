# Use the official Node.js image as the base image
FROM node:24-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install --production

# Copy the rest of the application code to the working directory
COPY . .

# Set environment variables
ENV NODE_ENV=production
ENV PORT=3000

# Expose the port the application runs on
EXPOSE 3000

# Configure networking
HEALTHCHECK --interval=30s --timeout=10s --retries=3 CMD curl -f http://localhost:3000/ || exit 1

# Start the application
CMD ["node", "index.js"]
