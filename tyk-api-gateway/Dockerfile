# Use the official Tyk Gateway image as the base image
FROM docker.tyk.io/tyk-gateway/tyk-gateway:latest

# Set the working directory to the Tyk Gateway directory
WORKDIR /opt/tyk-gateway

# Copy your local configuration file and apps directory into the container
# These paths should be provided as build-time arguments or via Docker volumes in the docker-compose file
COPY ./tyk.standalone.conf /opt/tyk-gateway/tyk.conf
COPY ./apps /opt/tyk-gateway/apps

# Expose port 8080 for the Tyk Gateway API
EXPOSE 8080


