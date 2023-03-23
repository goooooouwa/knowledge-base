FROM ruby:3.0.5

# Set our working directory inside the image
WORKDIR /wiki

# Install dependencies
RUN apt-get update -qq && apt-get -y install cmake

# Copy wiki data
# COPY . .
RUN git clone -b main https://github.com/goooooouwa/knowledge-base.git .

# Adding gems
# RUN gem install gollum
RUN bundle install

EXPOSE 4567
# EXPOSE 9292

ENTRYPOINT ["gollum", "/wiki", "--config", "/wiki/config.rb"]
# ENTRYPOINT ["bundle", "exec", "puma"]
