FROM ubuntu 
RUN apt-get update && apt-get install -y curl 
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash -

RUN apt-get update -y
RUN apt-get install -y nodejs

WORKDIR /app

COPY package.json .
COPY main.js .

RUN npm install

CMD ["node", "main.js"]
