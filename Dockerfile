FROM alpine

RUN apk add --no-cache curl gettext
RUN curl -L https://fly.io/install.sh | FLYCTL_INSTALL=/usr/local sh

ENV WORKDIR=/flymysql
WORKDIR $WORKDIR

COPY cmd ./cmd
COPY entrypoint.sh .
COPY fly.template.toml .

ENTRYPOINT ["./entrypoint.sh"]
