#!/bin/bash
# ./check.sh

FILE="/etc/crontab"

[[ -z `find $FILE -newermt "-24 hours"` ]]

if [ $? -eq 0 ]
then
    exit 1
else
    mail -s "$FILE has been modfified." root
fi
