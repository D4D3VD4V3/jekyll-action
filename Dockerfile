FROM ruby:2.7-alpine

LABEL version="2.0.1"
LABEL repository="https://github.com/helaili/jekyll-action"
LABEL homepage="https://github.com/helaili/jekyll-action"
LABEL maintainer="Alain Hélaïli <helaili@github.com>"

RUN apk add --no-cache git build-base
# Allow for timezone setting in _config.yml
RUN apk add --update tzdata
RUN apk add --update --no-cache build-base imagemagick6 imagemagick6-c++ \
    imagemagick6-dev imagemagick6-libs \
    jpeg-dev jpeg libpng-dev libpng tiff-dev tiff giflib-dev giflib libwebp-dev libwebp
RUN gem install rmagick
RUN gem install jekyll-webp

# debug
RUN bundle version

COPY LICENSE README.md /

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
