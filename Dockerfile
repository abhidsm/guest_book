FROM ruby:2.5.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /guest-book
WORKDIR /guest-book
COPY Gemfile /guest-book/Gemfile
COPY Gemfile.lock /guest-book/Gemfile.lock
RUN bundle install
ADD . /guest-book
COPY docker-entrypoint.sh /usr/local/bin
ENTRYPOINT ["docker-entrypoint.sh"]
