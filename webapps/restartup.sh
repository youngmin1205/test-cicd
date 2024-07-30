#!/bin/bash

APP_DIR="/home/ec2-user/app"
TOMCAT_WEBAPPS_DIR="/path/to/tomcat/webapps"

echo "## Copying application files to Tomcat webapps directory"
cp -r $APP_DIR/ROOT $TOMCAT_WEBAPPS_DIR/

echo "## Stopping Tomcat server"
sudo systemctl stop tomcat

sleep 5

echo "## Starting Tomcat server"
sudo systemctl start tomcat

echo "## Deployment complete"