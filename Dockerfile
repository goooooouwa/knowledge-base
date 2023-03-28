FROM ruby:3.0.5

# Set our working directory inside the image
WORKDIR /wiki

# Install dependencies
RUN apt-get update -qq && apt-get -y install cmake

# Adding gems
RUN gem install gollum
# RUN bundle install

# Copy wiki data
# COPY . .
# Invalidate git clone if new commits in remote repo
# ref: https://stackoverflow.com/questions/36996046/how-to-prevent-dockerfile-caching-git-clone
ADD https://api.github.com/repos/goooooouwa/knowledge-base/git/refs/heads/main version.json
RUN git clone -b main https://github.com/goooooouwa/knowledge-base.git .

EXPOSE 4567
# EXPOSE 9292

ENTRYPOINT ["gollum", "/wiki", "--config", "/wiki/config.rb"]
# ENTRYPOINT ["bundle", "exec", "puma"]
