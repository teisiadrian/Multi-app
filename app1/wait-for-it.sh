#!/usr/bin/env bash
# This script waits for a MySQL service to become available before starting the app

TIMEOUT=30  # increase this if needed
HOST="$1"
PORT="$2"

# Checking if help is requested
if [[ "$HOST" == "-h" || "$HOST" == "--help" ]]; then
    echo "Usage: wait-for-it.sh host port [-- command args]"
    exit 0
fi

# Wait for the specified time or until MySQL is available
for i in `seq $TIMEOUT`; do
    nc -z "$HOST" "$PORT" > /dev/null 2>&1
    result=$?
    if [ $result -eq 0 ]; then
        echo "Service $HOST:$PORT is available after $i seconds!"
        exec "$@"  # Start the app (the command following '--' in the Dockerfile)
    fi
    echo "Waiting for $HOST:$PORT..."
    sleep 1
done

echo "Service $HOST:$PORT is still not available after $TIMEOUT seconds!"
exit 1
