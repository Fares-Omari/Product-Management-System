# syntax=docker/dockerfile:1

ARG RUBY_VERSION=3.3.7
FROM ruby:$RUBY_VERSION-slim AS base

WORKDIR /rails

# Install base packages
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y curl default-mysql-client libjemalloc2 libvips && \
    rm -rf /var/lib/apt/lists/*

ENV RAILS_ENV="production" \
    BUNDLE_DEPLOYMENT="1" \
    BUNDLE_PATH="/usr/local/bundle" \
    BUNDLE_WITHOUT="development:test"

# Build stage
FROM base AS build

RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential default-libmysqlclient-dev git pkg-config && \
    rm -rf /var/lib/apt/lists/*

# Copy Gemfile from vatrenas_project
COPY vatrenas_project/Gemfile vatrenas_project/Gemfile.lock ./

# Install gems
RUN gem install bundler -v 2.6.3
RUN bundle install --jobs 4 --retry 3

# Copy application code
COPY vatrenas_project /rails

# Precompile bootsnap (optional)
RUN bundle exec bootsnap precompile --gemfile || true

# Precompile assets (dummy secret for build)
RUN SECRET_KEY_BASE_DUMMY=1 ./bin/rails assets:precompile

# Final runtime image
FROM base

COPY --from=build /usr/local/bundle /usr/local/bundle
COPY --from=build /rails /rails

# Create non-root user
RUN groupadd --system --gid 1000 rails && \
    useradd rails --uid 1000 --gid 1000 --create-home --shell /bin/bash && \
    chown -R rails:rails db log storage tmp
USER 1000:1000

ENTRYPOINT ["/rails/bin/docker-entrypoint"]
EXPOSE 80
CMD ["./bin/thrust", "./bin/rails", "server"]
