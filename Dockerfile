#Dockerfile

FROM ruby:2.7.2-alpine
MAINTAINER María Sanz Sánchez "mariasanz@correo.ugr.es"

#RUN apt-get update && apt-get install -y

# throw errors if Gemfile has been modified since Gemfile.lock
#RUN bundle config --global frozen 1

WORKDIR /test

COPY Gemfile /test/Gemfile
COPY Gemfile.lock /test/Gemfile.lock

# Builds the application
RUN bundle install

# specifies what command to run within the container
CMD ["rake", "test"]
