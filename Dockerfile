# The image to base this container off of
FROM node:alpine

# Run this command
# Make the directories and any parent directories needed
# (Ignore errors if they exist)
# Change permissions for the app directory in the node user's
# home directory
RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

# Set the working directory to the node user's home folder
WORKDIR /home/node/app

# Copy package and pack-lock to the current working directory
COPY package*.json ./

# Switch user to node before running npm install
USER node

# Install our application dependencies
RUN npm install

# Copy the application code to the container application directory
# Making sure the new files have the correct permissions
COPY --chown=node:node . .

# Expose this port on the container
EXPOSE 8080

# Run this command to start the application
CMD ["node", "app.js"]