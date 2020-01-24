FROM ruby:2.6.3
LABEL maintainer="Frank Labs"

RUN apt-get update

# Node.js
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && apt-get install -y nodejs

# Yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -\
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update \
    && apt-get install -y yarn

COPY . /usr/src/app
WORKDIR /usr/src/app

CMD ["rails","s","puma"]
