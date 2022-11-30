#!/bin/sh
for c in $( docker container ls -q ); do


if [ "$ACTION" = "add" ]; then
docker exec -u root -i $c sh <<EOF

mknod $DEVNAME c $MAJOR $MINOR
chmod 0666 $DEVNAME
chown :dialout $DEVNAME

EOF
elif [ "$ACTION" = "remove" ]; then

docker exec -u root -i $c sh <<EOF

rm $DEVNAME

EOF
fi

done
