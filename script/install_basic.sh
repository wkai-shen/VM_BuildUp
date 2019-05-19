#!/usr/bin/env bash
set -e

SCRIPT_HOME="/vagrant/script"
start_time="$(date -u +%s)"
echo "============== Install Docker START at $(date) =============="

### SET UP THE REPOSITORY
sudo apt update
sudo apt --assume-yes install \
    traceroute

echo "============== Install Docker END at $(date) =============="
end_time="$(date -u +%s)"
timeElapsed="$(($end_time-$start_time))"

## Through Vagrant sync folder, we can call other bash script.
## However bash script requires Unix line endings (LF) if the script is written in Windowns (CRLF)
## We can covert it by using Notepad++
## Soution Doc - https://stackoverflow.com/questions/16239551/eol-conversion-in-notepad
echo "The whole process took $(${SCRIPT_HOME}/utility/formatTimeFromSec.sh ${timeElapsed})"