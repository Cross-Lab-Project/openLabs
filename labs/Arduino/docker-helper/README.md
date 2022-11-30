# Docker Helper

This contains udev-rules and shell-scripts that aid in creating device nodes inside docker-containers using udev. (`docker-chardev` and `docker-usbdev` rules and scripts)

The `write_env`-rule and script are there for development purposes. The scrcipt writes its env to a /var/log/write_env.log the rule runs it on a udev event.

Copy them to the appropriate location udev-rules typicaliy go to `/etc/udev/` scripts might go to `/opt/bin/`
