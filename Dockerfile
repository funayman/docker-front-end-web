FROM node:10-alpine
MAINTAINER funayman <funayman@gmail.com>

RUN apk --update --no-cache add build-base libffi-dev curl git make python
RUN npm install npm@latest -g

## TAKE FROM https://github.com/blairg/docker-node-sass-alpine/blob/master/Dockerfile ##
# install libsass
RUN git clone https://github.com/sass/sassc && cd sassc && \
    git clone https://github.com/sass/libsass && \
    SASS_LIBSASS_PATH=/sassc/libsass make && \
    mv bin/sassc /usr/bin/sassc && \
    cd ../ && rm -rf /sassc

# created node-sass binary
ENV SASS_BINARY_PATH=/usr/lib/node_modules/node-sass/build/Release/binding.node
RUN git clone --recursive https://github.com/sass/node-sass.git && \
    cd node-sass && \
    git submodule update --init --recursive && \
    npm install && \
    node scripts/build -f && \
    cd ../ && rm -rf node-sass

# add binary path of node-sass to .npmrc
RUN touch $HOME/.npmrc && echo "sass_binary_cache=${SASS_BINARY_PATH}" >> $HOME/.npmrc

ENV SKIP_SASS_BINARY_DOWNLOAD_FOR_CI true
ENV SKIP_NODE_SASS_TESTS true
## END ##

RUN touch ~/.profile && curl -o- -L https://yarnpkg.com/install.sh | sh
RUN npm install -g grunt less jshint uglify-js webpack webpack-dev-server webpack-cli @angular/cli

WORKDIR /opt/app

CMD ["yarn"]
