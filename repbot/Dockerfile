FROM node
WORKDIR /usr/src/app

COPY ./src/package*.json ./
RUN npm install

COPY .env .
COPY ./src .

CMD [ "npm", "start" ]
