#!/bin/sh

LOGFILE=/games/xboxdrv/nexus.log

# rename so Steam doesn't get wacked
echo Renaming event$1 to nexus$1 >> $LOGFILE
mv /dev/input/event$1 /dev/input/nexus$1
#ln -s /dev/input/nexus$1 /dev/input/by-id/Nexus_Gamepad_$1 

# launch xboxdrv
echo Launching xboxdrv for nexus$1 >> $LOGFILE
echo "/usr/bin/xboxdrv -c /games/xboxdrv/nexus_gamepad.xboxdrv -o evdev=/dev/input/nexus$1 &" | at now
