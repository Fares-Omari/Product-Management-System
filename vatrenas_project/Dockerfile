# syntax=docker/dockerfile:1

ARG RUBY_VERSION=3.3.7
FROM ruby:$RUBY_VERSION-slim AS base

# Set working directory
WORKDIR /rails

# Install system dependencies
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
    build-essential \
    default-libmysqlclient-dev \
    libssl-dev \
    libreadline-dev \
    zlib1g-dev \
    git \
    curl \
    libjemalloc2 \
    libvips \
    nodejs \
    yarn && \
    rm -rf /var/lib/apt/lists/*


# Set bundler environment variables
ENV RAILS_ENV="production" \
    BUNDLE_DEPLOYMENT="1" \
    BUNDLE_PATH="/usr/local/bundle" \
    BUNDLE_WITHOUT="development:test"

# Install bundler
RUN gem install bundler -v 2.6.3

# Copy Gemfile and install gems
COPY Gemfile Gemfile.lock ./
RUN bundle install --jobs 4 --retry 3

# Copy full app code
COPY . .

# Precompile bootsnap (optional)
RUN bundle exec bootsnap precompile --gemfile || true

# Precompile Rails assets (dummy secret for build)
RUN SECRET_KEY_BASE_DUMMY=1 ./bin/rails assets:precompile

# Create non-root user
RUN groupadd --system --gid 1000 rails && \
    useradd rails --uid 1000 --gid 1000 --create-home --shell /bin/bash rails && \
    chown -R rails:rails db log storage tmp

USER rails

# Entrypoint for Render
ENTRYPOINT ["/rails/bin/docker-entrypoint"]

EXPOSE 80
CMD ["./bin/thrust", "./bin/rails", "server"]
