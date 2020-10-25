#Dockerfile

FROM ruby:2.7.2-alpine
MAINTAINER María Sanz Sánchez "mariasanz@correo.ugr.es"

RUN apt-get update

# throw errors if Gemfile has been modified since Gemfile.lock
#RUN bundle config --global frozen 1


RUN mkdir -p /app
WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

# Builds the application
RUN bundle install

COPY . /app

# specifies what command to run within the container
CMD ["rake", "test"]
