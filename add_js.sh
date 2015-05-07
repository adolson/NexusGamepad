#!/bin/sh

LOGFILE=/games/xboxdrv/nexus.log

# create the device file
mknod /dev/input/joystick$1 c 13 $1
# set ownership
chown root.input /dev/input/joystick$1
# set permissions
chmod 664 /dev/input/joystick$1

echo "Created /dev/input/joystick$1" >> $LOGFILE
