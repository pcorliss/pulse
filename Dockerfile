FROM alpine:3.3

RUN mkdir -p /app
WORKDIR /app
COPY Gemfile Gemfile.lock ./

ENV BUILD_PACKAGES="curl-dev ruby-dev build-base" \
    DEV_PACKAGES="zlib-dev libxml2-dev libxslt-dev tzdata yaml-dev postgresql-dev" \
    RUBY_PACKAGES="ruby ruby-io-console ruby-json ruby-bigdecimal yaml nodejs"

RUN apk --update --upgrade add $BUILD_PACKAGES $RUBY_PACKAGES $DEV_PACKAGES \
  && gem install -N bundler \
  && gem install -N nokogiri -- --use-system-libraries \
  && bundle config --global build.nokogiri  "--use-system-libraries" \
  && bundle install --jobs 20 --retry 5 --without development test \
  && find / -type f -iname \*.apk-new -delete \
  && apk del $BUILD_PACKAGES \
  && rm -rf /var/cache/apk/* \
  && rm -rf /usr/lib/lib/ruby/gems/*/cache/* \
  && rm -rf ~/.gem

ENV RAILS_ENV production
ENV RACK_ENV production

COPY . ./

RUN bundle exec rake assets:precompile

EXPOSE 3000

CMD bundle exec puma -C config/puma.rb
