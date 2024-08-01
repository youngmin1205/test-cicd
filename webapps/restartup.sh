#!/bin/bash

echo "## Stopping Tomcat server"

cd /home/tomcat/apache-tomcat-9.0.91/bin
./shutdown.sh

sleep 5

echo "## Starting Tomcat server"
./startup.sh

echo "## Deployment complete"