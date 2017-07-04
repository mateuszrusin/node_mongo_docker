#!/usr/bin/env bash

sudo docker stop $(sudo docker ps -a -q)
sudo docker rm $(sudo docker ps -a -q)

if [ "$1" == "-f" ]; then
    sudo docker build -t node node/
    sudo docker build -t www  www/
fi

sudo docker run -p 3000:3000                     --name node  -d node #node app
sudo docker run -p 27017:27017 -v "$(pwd)":/data --name mongo -d mongo mongod --smallfiles
sudo docker run -p 80:80                         --name www   -d www