#!/bin/bash
cd /home/ubuntu/todo-cicd
npm start > app.out.log 2> app.err.log < /dev/null &

