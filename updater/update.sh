#!/bin/bash
##############################################
#Script Name	: update.sh
#Description	: this script runs a list of commands against a list of hosts and stores stdout and stderr
##############################################

SCRIPTPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" #location script is running from

LOG_DIR=$HOME/updatelogs #log directory
HOSTS=$SCRIPTPATH/hosts_up.txt #list of hosts
CMDLIST=$SCRIPTPATH/commandlist #list of commands to run against the list of hosts

echo Script Path: $SCRIPTPATH
echo Log directory: $LOG_DIR
echo Hosts file: $HOSTS
echo Command List: $CMDLIST
parallel-ssh -o $LOG_DIR -e $LOG_DIR/errorlogs -h $HOSTS -I<$CMDLIST
