# Use an official Node runtime as the parent image
FROM ubuntu:latest

# Set the working directory in the container to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
ADD . /app

# Make the container's port 80 available to the outside world
EXPOSE 4141

# require packages
RUN apt-get update && apt-get install -y git nfs-common wget unzip
# put terraform
RUN wget https://releases.hashicorp.com/terraform/0.11.13/terraform_0.11.13_linux_amd64.zip && unzip -d /usr/local/bin/ terraform_0.11.13_linux_amd64.zip

# ca certs
RUN mkdir -p /etc/ssl/certs
ADD ca-certificates.crt /etc/ssl/certs/ca-certificates.crt

# Args

ENV PATH="/app/usr/local/bin:${PATH}"
#
# Run app.js using node when the container launches
CMD ["./torun"]
