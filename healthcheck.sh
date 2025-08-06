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
    echo ""

    echo " Service Status Check:"
    for service in nginx ssh; do
        if systemctl is-active --quiet $service; then
            echo "$service is running."
        else
            echo "$service is not running."
        fi
    done
    echo ""
    echo "=========================="
    echo ""
} >> "$LOG_FILE"

