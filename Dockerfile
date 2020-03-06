FROM ruby:2.7.0

RUN apt-get update -qq && \
  apt-get install -y postgresql-client && \
  apt-get install -y vim && \
  apt-get install -y locales

RUN echo "ja_JP.UTF-8 UTF-8" > /etc/locale.gen && \
  locale-gen ja_JP.UTF-8 && \
  /usr/sbin/update-locale LANG=ja_JP.UTF-8
ENV LC_ALL ja_JP.UTF-8

ENV APP_PATH=/app
RUN mkdir "$APP_PATH"
WORKDIR "$APP_PATH"
COPY . "$APP_PATH"
COPY Gemfile "${APP_PATH}/Gemfile"
COPY Gemfile.lock "${APP_PATH}/Gemfile.lock"

RUN gem install bundler
