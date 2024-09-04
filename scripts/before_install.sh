#!/bin/bash
# Stop the existing application process
pm2 stop todo-cicd || true
pm2 delete todo-cicd || true
