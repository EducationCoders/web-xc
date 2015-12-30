#!/usr/bin/bash

set -e
set -o pipefail

SCRIPT_DIR=`dirname $0`
FLASK_FRAMEWORK_NAME=flask

HOST=127.0.0.1
PORT=5000
DEBUG=True


function log_msg()
{
    echo "> $1"
}

function log_error()
{
    log_msg "Error - $1"
}

function start_server()
{
    log_msg "Changing dir to $SCRIPT_DIR"
    cd "$SCRIPT_DIR"

    virtualenv $SCRIPT_DIR/$FLASK_FRAMEWORK_NAME/bin/activate || log_error "Failed to activate python" exit -1

    python application.py --host $HOST --port $PORT --debug $DEBUG || log_error "Failed to start application"
}


start_server