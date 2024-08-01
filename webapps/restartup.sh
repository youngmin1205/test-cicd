#!/bin/bash

APP_DIR="/home/ec2-user/app"
TOMCAT_APPS_DIR="/home/tomcat/apachetomcat-9.0.91/webapps"
TOMCAT_BIN_DIR="/home/tomcat/apache-tomcat-9.0.91/bin"

echo "## Copying files"
cp -r $APP_DIR/ROOT $TOMCAT_APPS_DIR/

echo "## Stopping Tomcat server"
sudo $TOMCAT_BIN_DIR/shutdown.sh

sleep 5

echo "## Starting Tomcat server"
sudo $TOMCAT_BIN_DIR/shutdown.sh

echo "## Deployment complete"