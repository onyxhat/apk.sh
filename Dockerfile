FROM alpine:latest

RUN mkdir -p /app/.apk.sh/ /apks/
WORKDIR /apks/

COPY ./apk.sh /app/

RUN apk update && \
    apk add bash \
            wget \
            unzip \
            openjdk17 && \
    rm -vrf /var/cache/apk/*

RUN /app/apk.sh setup

ENTRYPOINT [ "/app/apk.sh" ]