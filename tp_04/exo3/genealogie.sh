#!/usr/bin/env bash
function usage() {
    echo "Usage: $0 <pid>"
    exit 1
}
if [ $# -eq 0 ]; then
    echo needs a argument
    usage
fi
PID=$1
PID_EXIST=$(ps aux | awk '{print $2}' | grep -w "$PID")
if [ ! "$PID_EXIST" ]; then
    echo "the process $PID is not exist"
fi
