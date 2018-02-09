FROM node:8-alpine
MAINTAINER funayman <funayman@gmail.com>

RUN npm install -g grunt less jshint

WORKDIR /opt/app

CMD ["yarn"]
