FROM node:8-alpine
MAINTAINER funayman <funayman@gmail.com>

RUN apk --update --no-cache add ruby ruby-dev build-base libffi-dev curl && \
  echo "gem: --no-rdoc --no-ri" > ~/.gemrc && \
  gem update --system && \
  gem install sass --no-user-install
RUN touch ~/.profile && curl -o- -L https://yarnpkg.com/install.sh | sh
RUN npm install -g grunt less jshint webpack webpack-dev-server webpack-cli

WORKDIR /opt/app

CMD ["yarn"]
