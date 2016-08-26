FROM ruby:2.3.1
MAINTAINER Rishi Javia <rishijavia@lclark.edu>, Nick Budak <budak@lclark.edu>

# Build-time metadata as defined at http://label-schema.org
ARG BUILD_DATE
ARG VCS_REF
LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.docker.dockerfile="/Dockerfile" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-type="Git" \
      org.label-schema.vcs-url="https://github.com/WatzekDigitalInitiatives/fitbit-ror"

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /fitbit-ror
ADD . /fitbit-ror
WORKDIR /fitbit-ror
RUN bundle install --without production
RUN chmod +x *.sh
CMD ["init.sh"]
