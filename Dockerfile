FROM ruby:2.2

# Copy your application into the container.
COPY . .

# Build your application.

# Install apt based dependencies required to run Rails as 
# well as RubyGems. As the Ruby image itself is based on a 
# Debian image, we use apt-get to install those.
RUN apt-get update && apt-get install -y \ 
  build-essential \ 
  nodejs \
  libxml2-dev \
  libxslt-dev \
  tzdata \
  libmysqlclient-dev

RUN bundle config build.nokogiri --use-system-libraries && \
    # Install application gems.
    bundle install --jobs 4 --without development test --with production && \
    # Precompile Rails assets.
    RAILS_ENV=production bundle exec rake assets:precompile

# Run your application with Puma.
CMD puma -e production
