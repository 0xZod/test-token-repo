FROM alpine:latest

RUN apk add --no-cache imagemagick

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]