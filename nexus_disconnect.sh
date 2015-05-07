#!/bin/sh

LOGFILE=/games/xboxdrv/nexus.log

echo "Disconnect received for nexus$1" >> $LOGFILE

# get the pid of the xboxdrv instance
XBPID=`ps aux | grep xboxdrv | grep nexus$1 | awk '{ print $2 }'`
if [ ! -z "$XBPID" ]
then
        echo "Killing xboxdrv ($XBPID) for nexus$1" >> $LOGFILE
        # try to gracefully kill xboxdrv
        kill $XBPID
        # force kill if it didn't
        sleep 2 && kill -9 $XBPID
fi

# remove the stale nexus device
if [ -e /dev/input/nexus$1 ]
then
        echo "Removing /dev/input/nexus$1 device" >> $LOGFILE
        rm /dev/input/nexus$1
        #rm /dev/input/by-id/Nexus_Gamepad_$1
fi
