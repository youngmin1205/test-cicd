#!/bin/bash

APP_DIR="/home/ec2-user/app"
TOMCAT_WEBAPPS_DIR="/home/tomcat/apache-tomcat-9.0.91/webapps"

echo "## Copying files"
cp -r $APP_DIR/ROOT $TOMCAT_WEBAPPS_DIR/

echo "## Stopping Tomcat server"
sudo systemctl stop tomcat

sleep 5

echo "## Starting Tomcat server"
sudo systemctl start tomcat

echo "## Deployment complete"