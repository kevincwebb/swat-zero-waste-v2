FROM ruby:2.5

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

ENV RAILS_ROOT /var/www/szw
RUN mkdir -p $RAILS_ROOT
WORKDIR $RAILS_ROOT

ENV RAILS_ENV production
ENV RACK_ENV production
ENV BUNDLER_VERSION 2.0.1

RUN gem install bundler --no-document -v '2.0.1'

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

RUN bundle install --jobs 5 --retry 5 --without development test

EXPOSE 8000

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
