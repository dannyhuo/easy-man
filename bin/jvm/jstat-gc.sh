#!/usr/bin/env bash
HOST=$1
USER=$2
SERVICE_NAME=$3

pidCmd=`ssh ${USER}@${HOST} jps -lm |awk /${SERVICE_NAME}/'{print $1}'`
ssh ${USER}@${HOST} jstat -gc ${pidCmd}