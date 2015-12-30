#!/usr/bin/bash

set -e
set -o pipefail

CURRENT_PROJECT_DIR=$PWD
FLASK_DIR_NAME=flask

cd "$CURRENT_PROJECT_DIR"

echo "> Checking virtualenv..."

if [ ! -f /usr/local/bin/virtualenv ]
then
    echo "> Installing virtualenv..."
    #https://pypi.python.org/packages/source/v/virtualenv/virtualenv-13.1.2.tar.gz
    sudo easy_install virtualenv
    echo "> Installation successful"
fi

rm -rf "$FLASK_DIR_NAME"

echo "> Creating virtualenv..."
virtualenv $FLASK_DIR_NAME

echo "> Activating virtualenv..."
source $FLASK_DIR_NAME/bin/activate || echo "> Failed to activate virtualenv" exit -1

echo "> Installing Flask framework for current user only"
pip install Flask

EXTERNAL_PATH_STRING="<pydev_pathproperty name=\"org.python.pydev.PROJECT_EXTERNAL_SOURCE_PATH\"><path>\"$CURRENT_PROJECT_DIR\"/venv/lib/python2.7</path></pydev_pathproperty>"


echo "> Done!"



