# Suggested code may be subject to a license. Learn more: ~LicenseLog:3166388319.
# Suggested code may be subject to a license. Learn more: ~LicenseLog:308075120.
# Suggested code may be subject to a license. Learn more: ~LicenseLog:892036002.
# Suggested code may be subject to a license. Learn more: ~LicenseLog:1778614999.
#dockerfile
# Use the official Node.js 20 image  based on Alpine Linux as the build stage
FROM node:20-alpine as build

# Set the working directory inside the container to /app
WORKDIR /app

# Copy package.json and package-lock.json (if present) to the working directory
COPY package*.json ./

# Install project dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Build the Angular application
RUN npm run build

# Use the official Nginx image based on Alpine Linux for the production stage
FROM nginx:alpine

# Copy the built Angular application from the build stage to the Nginx web server directory
COPY --from=build /app/dist/myapp/browser /usr/share/nginx/html

# Expose port 80 for HTTP traffic
EXPOSE 80

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
