 1. Problem Statement

Before Docker, running applications was often difficult because:

Different environments caused bugs (“it works on my machine” problem)
Dependency installation was inconsistent
Deployment was slow and error-prone

 Docker solves this by packaging everything into a container that runs the same everywhere.

 2. Understanding Images vs Containers
Image 
A blueprint of an application (read-only template).
Container 
A running instance of an image.

 Example:

Image = Class
Container = Object
 3. Running Ubuntu Image in Container

You can run a Linux Ubuntu container using:

docker run -it ubuntu

Inside the container, you can use Linux commands like:


apt update
 4. Multiple Containers

Docker allows running multiple containers at the same time:

docker run ubuntu
docker run node
docker run nginx

 Each container runs independently and does not affect others.

 5. Port Mappings

Containers run in isolation, so ports must be exposed:

docker run -p 8080:3000 myapp

 Format:

HostPort : ContainerPort

Now access app using:

http://localhost:3000
 6. Environment Variables

Environment variables are used to configure applications:

docker run -e NODE_ENV=production myapp

 You can pass multiple variables:

docker run -e PORT=3000 -e DB_HOST=localhost myapp
 7. Dockerization of Node.js Application
a. Dockerfile

A Dockerfile defines how to build your app image:

FROM ubuntu 
RUN apt-get update && apt-get install -y curl 
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash -

RUN apt-get update -y
RUN apt-get install -y nodejs

COPY package.json package.json
COPY package-lock.json package-lock.json
COPY main.js main.js



RUN npm install

ENTRYPOINT ["node", "main.js"]

b. Caching Layers

Docker uses layers to optimize builds:

npm install runs only if package.json changes
Faster rebuilds using cache

 Best practice: copy dependencies first, then source code.

c. Publishing to Docker Hub

Steps:

docker login
docker build -t sshamir/youtube-nodejs .
docker push sshamir/youtube-nodejs:latest
 9. Docker Compose

Docker Compose helps manage multiple containers easily.

Create a docker-compose.yml file:

version: '3.8'

services:
  postgres:
    image: postgres #hub.docker.com/_/postgres
    ports:
      - "5432:5432"
    environment:
      POSTGRES_USER:  postgres
      POSTGRES_DB: review
      POSTGRES_PASSWORD: password

  redis:
    image: redis #hub.docker.com/_/redis
    ports:
      - "6379:6379"

    
a. Services

Each container is called a service:

app
database
redis
b. Port Mapping

Inside Compose:

ports:
  - "3000:3000"
c. Environment Variables
environment:
  - PORT=3000
  - DB_HOST=localhost
 Key Takeaways
Docker simplifies deployment and development
Images are templates; containers are running instances
Port mapping connects container apps to your machine
Docker Compose manages multi-container apps easily
Docker Hub is used to store and share images
