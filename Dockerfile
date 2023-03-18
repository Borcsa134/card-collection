FROM node:19-alpine3.16

RUN apk update && apk upgrade
RUN apk add chromium postgresql-libs vim postgresql-dev

ENV CHROME_BIN=/usr/bin/chromium-browser

RUN mkdir -p /usr/src/app/
COPY ./ ./usr/src/app/
WORKDIR /usr/src/app/

RUN yarn install
