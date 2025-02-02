FROM jenkins/jenkins:lts-jdk17
USER root

# Install prerequisites
RUN apt-get update && apt-get install -y lsb-release curl apt-transport-https ca-certificates gnupg2

# Add Docker’s official GPG key and set up the repository
RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
      https://download.docker.com/linux/debian/gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
      https://download.docker.com/linux/debian $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list

# Install docker-ce-cli and docker-compose
RUN apt-get update && apt-get install -y docker-ce-cli docker-compose

USER jenkins
