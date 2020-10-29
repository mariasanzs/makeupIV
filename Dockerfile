#Dockerfile

FROM ruby:2.7.2-alpine
LABEL version="1.0.0" maintainer="María Sanz Sánchez <mariasanz@correo.ugr.es>"

#RUN apt-get update && apt-get install -y

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

#Create a dedicated user for running test
RUN adduser -D my-test-user

#Gives ownership to our user 
RUN chown my-test-user $GEM_HOME &&  chmod 777 $GEM_HOME

#Set the user for CMD
USER my-test-user

WORKDIR /home/my-test-user

COPY --chown=my-test-user Gemfile ./
COPY --chown=my-test-user Gemfile.lock ./

# Builds the application
RUN bundle install

RUN rm -r /home/my-test-user/Gemfile*

WORKDIR /test

# specifies what command to run within the container
CMD ["rake", "test"]
