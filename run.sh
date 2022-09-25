#!/bin/sh

docker build -t usql . && docker run -p 9191:8080 usql