#!/bin/bash

# Define log file
LOG_FILE="healthlog.txt"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

{
    echo "Health Check - $TIMESTAMP"
    echo "=========================="
    echo ""

    echo " Date and Time:06/08/25 and 1:20 am"
    date
    echo ""

    echo " Uptime:1:20 am "
    uptime
    echo ""

    echo " CPU Load:"
    top -bn1 | grep "load average"
    echo ""

    echo " Memory Usage:"
    free -m



    echo ""

    echo " Disk Usage:"
    df -h
    echo ""

    echo " Top 5 Memory Consuming Processes:"
    ps aux --sort=-%mem | head -n 6
    echo "" >> $LOGFILE

# Check Services (from command-line arguments)
if [ "$#" -eq 0 ]; then
    echo "No services were specified to check." >> $LOGFILE
else
    echo "Service Status:" >> $LOGFILE
    for SERVICE in "$@"; do
        STATUS=$(systemctl is-active $SERVICE 2>/dev/null)
        if [ "$STATUS" == "active" ]; then
            echo "$SERVICE: running" >> $LOGFILE
        elif [ "$STATUS" == "inactive" ]; then
            echo "$SERVICE: not running" >> $LOGFILE
        elif [ "$STATUS" == "unknown" ]; then
            echo "$SERVICE: unknown service" >> $LOGFILE
        else
            echo "$SERVICE: $STATUS" >> $LOGFILE
        fi
    done
fi

echo "" >> $LOGFILE
echo "Health check complete." >> $LOGFILE
echo "" >> $LOGFILE
