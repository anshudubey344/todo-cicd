#!/bin/bash
cd /home/ubuntu/todo-cicd
sudo npm install
sudo npm install -g pm2
sudo pm2 start app.js -f --name todo-cicd
