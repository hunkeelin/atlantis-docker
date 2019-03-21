# Use an official Node runtime as the parent image
FROM ubuntu:latest

# Set the working directory in the container to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
ADD . /app

# Make the container's port 80 available to the outside world
EXPOSE 4141

# require packages
RUN apt-get update && apt-get install -y git nfs-common

# ca certs
RUN mkdir -p /etc/ssl/certs
ADD ca-certificates.crt /etc/ssl/certs/ca-certificates.crt

# Args

ENV PATH="/app/usr/local/bin:${PATH}"
#
# Run app.js using node when the container launches
CMD ["./torun"]
