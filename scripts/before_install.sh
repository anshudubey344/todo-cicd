#!/bin/bash
# Stop the Node.js application
pm2 stop todo-app || true
pm2 delete todo-app || true
