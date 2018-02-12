FROM node:8-alpine
MAINTAINER funayman <funayman@gmail.com>

RUN apk --update --no-cache add ruby ruby-dev build-base libffi-dev && \
  echo "gem: --no-rdoc --no-ri" > ~/.gemrc && \
  gem update --system && \
  gem install sass --no-user-install
RUN npm install -g grunt less jshint

WORKDIR /opt/app

CMD ["yarn"]
