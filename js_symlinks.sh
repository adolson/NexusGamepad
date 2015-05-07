#!/bin/sh

LOGFILE=/games/xboxdrv/nexus.log

echo "==============================" >> $LOGFILE
echo "Change to real js* devices, running symlink script..." >> $LOGFILE

# ensure all sjs* devices still exist
#for sjs in /dev/input/sjs*
for sjs in `seq 0 9`
do
        # remove any bad symlinks
        if [ -L "/dev/input/sjs$sjs" ] && [ ! -e "/dev/input/sjs$sjs" ]
        then
                echo "Removing dead symlink sjs$sjs" >> $LOGFILE
                rm /dev/input/sjs$sjs
        fi
done

# ensure all joystick* devices are linked as sjs* devices
#for joystick in /dev/input/joystick*
for joystick in `seq 0 9`
do
        # if the joystick* device doesn't exist, skip the rest of this iteration
        if [ ! -c "/dev/input/joystick$joystick" ]
        then
                #echo "joystick$joystick doesn't exist, skipping" >> $LOGFILE
                continue
        fi
        #echo "Checking sjs* symlinks for joystick$joystick" >> $LOGFILE

        # otherwise, check if this joystick* device has a sjs* symlink
        LINK=`find /dev/input/ -maxdepth 1 -lname /dev/input/joystick$joystick -name 'sjs*'`

        # no sjs* symlink exists, so create the next available one
        if [ -z "$LINK" ]
        then
                #echo "No sjs* symlink for joystick$joystick found" >> $LOGFILE
                # find first available slot, from 0 to 9, and stick it in there
                for sjs in `seq 0 9`
                do
                        if [ ! -e /dev/input/sjs$sjs ]
                        then
                                echo "Symlinking device joystick$joystick to sjs$sjs" >> $LOGFILE
                                ln -sf /dev/input/joystick$joystick /dev/input/sjs$sjs
                                break
                        fi
                done
        #else
                #echo "A sjs* symlink for joystick$joystick was already found, skipping" >> $LOGFILE
        fi
done

# now that we have all of our sorted devices, wipe out all js* devices and remake them
echo "Deleting any js* devices and rebuilding via symlinks"
rm /dev/input/js[0-9]

# loop through the sjs* devices and symlink them to js*
for num in `seq 0 9`
do
        if [ -e /dev/input/sjs$num ]
        then
                echo "Copying symlink sjs$num to js$num" >> $LOGFILE
                # add the symlink
                cp -a /dev/input/sjs$num /dev/input/js$num
        fi
done
