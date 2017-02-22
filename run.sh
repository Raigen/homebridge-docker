echo "removing"
rm -f /var/run/dbus/pid /var/run/avahi-daemon/pid

echo "starting dbus"
dbus-daemon --system
echo "starting avahi"
avahi-daemon -D

homebridge
