#!/bin/sh

echo -n ===============================  >> /var/log/write_env.log
date  >> /var/log/write_env.log
env >> /var/log/write_env.log
cat >> /var/log/write_env.log << EOF
$MINOR
EOF