FROM ruby:3.1.2

# Set our working directory inside the image
WORKDIR /wiki

# Install dependencies
RUN apt-get update -qq && apt-get -y install cmake

# Adding gems
# RUN gem install gollum
RUN bundle install

# Copy wiki data
# COPY . .
RUN git clone -b main https://github.com/goooooouwa/wiki-knowledge.git .

EXPOSE 9292

# ENTRYPOINT ["gollum", "/wiki", "--config", "/wiki/config.rb"]
ENTRYPOINT ["bundle", "exec", "puma"]
