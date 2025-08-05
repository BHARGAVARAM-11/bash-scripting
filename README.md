#  Health Check Script

## Project Description

This project provides a Linux shell script `healthcheck.sh` that collects and logs important system health metrics.

##  Features

- System date and time
- Uptime
- CPU load
- Memory usage
- Disk usage
- Top 5 memory-consuming processes
- Service status checks for `nginx` and `ssh`
- Logs all the above info into `healthlog.txt` with a timestamp

##  Usage

Make sure the script is executable:

```bash
chmod +x healthcheck.sh
