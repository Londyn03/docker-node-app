# Use the official Node.js 16 image as the base image
FROM node:16

# Set the working directory inside the container
WORKDIR /app

# Copy package.json (and package-lock.json) first so Docker can cache the install step
COPY package*.json ./

# Install the application's dependencies
RUN npm install

# Copy the rest of the application files into the container
COPY . .

# Document that the app listens on port 3000
EXPOSE 3000

# Start the application
CMD ["npm", "start"]