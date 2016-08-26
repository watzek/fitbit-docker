FROM ruby:2.3.1
MAINTAINER Rishi Javia <rishijavia@lclark.edu>, Nick Budak <budak@lclark.edu>
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /fitbit-ror
WORKDIR /fitbit-ror
ADD Gemfile /fitbit-ror/Gemfile
ADD Gemfile.lock /fitbit-ror/Gemfile.lock
RUN bundle install --without production
ADD . /fitbit-ror
ADD init.sh /init.sh
RUN chmod +x init.sh
CMD ["/init.sh"]
