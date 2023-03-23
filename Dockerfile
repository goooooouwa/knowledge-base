FROM ruby:3.0

# Set our working directory inside the image
WORKDIR /wiki

# Install dependencies
RUN apt-get update -qq && apt-get -y install cmake

# Adding gems
RUN gem install gollum

# Copy wiki data
# COPY . .
RUN git clone -b main https://github.com/goooooouwa/wiki-knowledge.git .

EXPOSE 4567

ENTRYPOINT ["gollum", "/wiki", "--config", "/wiki/config.rb"]

