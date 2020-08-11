FROM node:12.13.0-alpine3.10

COPY . /app

WORKDIR /app

CMD npm install

CMD npm start

EXPOSE 3000
