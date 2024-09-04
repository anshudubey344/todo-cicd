#!/bin/bash
# Stop the existing application process
pm2 stop todo-app || true
pm2 delete todo-app || true
pkill node || true
