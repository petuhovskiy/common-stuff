FROM node
WORKDIR /usr/src/app
ENV LANG C.UTF-8

COPY ./src/package*.json ./
RUN npm install

COPY .env .
COPY ./src .

RUN g++ markov.cpp -std=c++14 -o markov

CMD [ "npm", "start" ]
