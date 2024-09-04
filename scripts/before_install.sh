#!/bin/bash

# Define the port and process name to be stopped
PORT=8001
PROCESS_NAME="node"

# Find and kill the process listening on the specified port
PID=$(lsof -t -i :$PORT)

if [ -n "$PID" ]; then
    echo "Stopping existing Node.js application with PID $PID"
    kill -9 $PID
else
    echo "No Node.js application is running on port $PORT"
fi
