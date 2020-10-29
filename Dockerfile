#Dockerfile

FROM ruby:2.7.2-alpine
LABEL version="1.0.0" maintainer="María Sanz Sánchez <mariasanz@correo.ugr.es>"

#RUN apt-get update && apt-get install -y

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

#Create a dedicated user for running test
RUN adduser -D my-test-user

#Set the user for CMD
USER my-test-user

WORKDIR /test

COPY --chown=my-test-user Gemfile /test/Gemfile
COPY --chown=my-test-user Gemfile.lock /test/Gemfile.lock

# Builds the application
RUN bundle install

RUN rm -r /test/Gemfile*

# specifies what command to run within the container
CMD ["rake", "test"]
