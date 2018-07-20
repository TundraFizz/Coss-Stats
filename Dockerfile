FROM node:carbon

WORKDIR /usr/src/app

COPY package.json .

RUN apt-get update && \
    npm install --production

COPY . .

EXPOSE 80

CMD ["npm", "start"]
