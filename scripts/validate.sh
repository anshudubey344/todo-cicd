#!/bin/bash

if curl -s http://localhost:8000/ > /dev/null; then
    echo "Service is running successfully."
else
    echo "Service validation failed!" && exit 1
fi


