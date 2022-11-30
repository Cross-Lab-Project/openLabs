#!/bin/sh
if [ "$DEVTYPE" = "usb_device" ]; then
for c in $( docker container ls -q ); do

if [ "$ACTION" = "add" ]; then
docker exec -u root -i $c sh <<EOF

mkdir -p $(dirname $DEVNAME)
mknod $DEVNAME c $MAJOR $MINOR
chmod 0666 $DEVNAME
chown :dialout $DEVNAME

EOF
elif [ "$ACTION" = "remove" ]; then

docker exec -u root -i $c sh <<EOF

rm $DEVNAME
rmdir -p --ignore-fail-on-non-empty $(dirname $DEVNAME)

EOF
fi

done
fi
