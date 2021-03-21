FROM ruby:2.7.2-alpine3.12

ARG RAILS_ROOT=/app
ARG PACKAGES="vim postgresql-client postgresql-dev curl bash tzdata build-base git yarn"
ENV BUNDLE_APP_CONFIG="$RAILS_ROOT/.bundle"

RUN apk update \
    && apk upgrade \
    && apk add --update --no-cache $PACKAGES

RUN gem install bundler:2.1.4

RUN mkdir $RAILS_ROOT
WORKDIR $RAILS_ROOT

COPY Gemfile* ./
RUN bundle config set no-cache 'true' && bundle install --jobs 4 --path=vendor/bundle

COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile

ADD . $RAILS_ROOT
ENV PATH=$RAILS_ROOT/bin:${PATH}

VOLUME ["/app/public"]

EXPOSE 8080

CMD ["rails", "server", "-b", "0.0.0.0", "-p", "8080"]
