#FROM node:alpine
FROM raigen/rpi-alpine-node

RUN apk add --update --no-cache --virtual .build-deps \
      git \
      python \
      gcc \
      g++ \
      make \
 && apk add --update --no-cache \
      dbus \
      avahi \
      avahi-compat-libdns_sd \
      avahi-dev \
      avahi-tools

#FROM node:latest
#FROM hypriot/rpi-node

#RUN apt-get update && \
    #apt-get upgrade -y && \
    #apt-get install -y libnss-mdns avahi-discover libavahi-compat-libdnssd-dev libkrb5-dev

#RUN sed -i 's/#enable-dbus=yes/enable-dbus=yes/g' /etc/avahi/avahi-daemon.conf

RUN npm install -g --unsafe-perm homebridge  &&\
    npm install -g homebridge-fhem

RUN apk del .build-deps

COPY avahi-daemon.conf /etc/avahi/avahi-daemon.conf

USER root
RUN mkdir -p /var/run/dbus

ADD ./run.sh /root/run.sh

CMD ["sh", "/root/run.sh"]

