FROM ruby:3.1.0
# Set an environment variable to store the application's directory
ENV APP_HOME /myapp

# Create the application's directory and set it as the working directory
RUN mkdir $APP_HOME
WORKDIR $APP_HOME
COPY . /myapp
RUN bundle install
# WORKDIR /app

