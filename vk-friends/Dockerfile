FROM node
WORKDIR /usr/src/app
ENV LANG C.UTF-8

COPY ./src/package*.json ./
RUN npm install

COPY ./src .

EXPOSE 3000

CMD [ "npm", "start" ]
