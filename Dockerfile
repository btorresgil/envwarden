ARG ARCH=library
FROM $ARCH/node:12-alpine

LABEL maintainer="envwarden"

RUN apk update && apk add bash wget jq

RUN npm install -g --ignore-scripts @bitwarden/cli@1.8.0

ADD envwarden /usr/local/bin

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["envwarden"]
