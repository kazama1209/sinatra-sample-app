FROM ruby:2.6.6

ENV APP_PATH /sinatra-sample-app

ADD ./Gemfile* $APP_PATH/
WORKDIR $APP_PATH
RUN bundle install

ADD . $APP_PATH
