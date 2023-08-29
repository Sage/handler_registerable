FROM ruby:3

ENV APP_HOME /usr/src/app/

WORKDIR $APP_HOME

# Create the app dir
RUN mkdir -p $APP_HOME
COPY . .

RUN bundle install
