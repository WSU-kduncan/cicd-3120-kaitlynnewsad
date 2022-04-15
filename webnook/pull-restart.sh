#!/bin/bash

# kill any current bird website containers then delete any unused images and containers
docker kill static-nginx
yes | docker system prune
#Get updated image
docker pull kaitlynnewsad/project-5:latest
#Create container from image
docker run -d --name static-nginx -p 80:80 kaitlynnewsad/project-5:latest
