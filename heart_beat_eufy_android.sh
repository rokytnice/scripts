#!/bin/bash

HOST="192.168.1.111"
PORT=554
INTERVAL=300
HEARTBEAT_URL="https://hc-ping.com/36d68882-51f7-43e9-8e4d-d62b5384b013"

echo "🔍 Starte Überwachung von $HOST:$PORT ..."

while true; do
    if (echo > /dev/tcp/$HOST/$PORT) >/dev/null 2>&1; then
        echo "$(date '+%Y-%m-%d %H:%M:%S') ✅ Port $PORT ist offen. Sende Heartbeat..."
        curl -fsS --retry 3 $HEARTBEAT_URL > /dev/null
    else
        echo "$(date '+%Y-%m-%d %H:%M:%S') ❌ Port $PORT ist NICHT erreichbar. Kein Heartbeat."
        curl -fsS --retry 3 $HEARTBEAT_URL/fail > /dev/null
    fi
    sleep $INTERVAL
done
