FROM hypriot/rpi-node

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y libnss-mdns avahi-discover libavahi-compat-libdnssd-dev libkrb5-dev

RUN npm install -g --unsafe-perm homebridge  && \
    npm install -g homebridge-fhem

COPY avahi-daemon.conf /etc/avahi/avahi-daemon.conf

USER root
RUN mkdir -p /var/run/dbus

ADD ./run.sh /root/run.sh

CMD ["sh", "/root/run.sh"]

