#!/bin/sh

LOGFILE=/games/xboxdrv/nexus.log

# remove the device file
rm /dev/input/joystick$1

echo "Deleted /dev/input/joystick$1" >> $LOGFILE
