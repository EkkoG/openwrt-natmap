#!/bin/sh

text="$1"
token=$2

while true; do
    curl -4 -Ss -X POST \
    -H 'Content-Type: application/json' \
    -d '{"token": "'"${IM_NOTIFY_CHANNEL_PUSHPLUS_TOKEN}"'", "content": "'"${text}"'", "title": "NATMap"}' \
    "http://www.pushplus.plus/send"
    status=$?
    if [ $status -eq 0 ]; then
        break
    else
        sleep 3
    fi
done