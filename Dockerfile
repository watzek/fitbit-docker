FROM ruby:2.3.1
MAINTAINER Rishi Javia <rishijavia@lclark.edu>
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /fitbit-ror
ADD . /fitbit-ror
WORKDIR /fitbit-ror
RUN bundle install --without production
RUN chmod +x *.sh
CMD ["init.sh"]
