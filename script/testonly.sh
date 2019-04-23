#!/usr/bin/env bash
set -ex

SCRIPT_HOME="/vagrant/script"
start_time="$(date -u +%s)"
echo "============== Install Docker START at $(date) =============="

echo "============== Install Docker END at $(date) =============="
end_time="$(date -u +%s)"
timeElapsed="$(($end_time-$start_time))"
echo "The whole process took $(${SCRIPT_HOME}/utility/formatTimeFromSec.sh ${timeElapsed})"