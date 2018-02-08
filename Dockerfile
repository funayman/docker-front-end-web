FROM node:8-alpine
MAINTAINER funayman <funayman@gmail.com>

RUN apk update \
  && apk upgrade \
  && apk add --no-cache git openssh yarn 

RUN npm install -g grunt less jshint scss

WORKDIR /opt/app

CMD ["npm"]
