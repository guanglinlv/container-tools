#!/bin/bash


TARGET_DIR=$1
TARGET_DIR=${TARGET_DIR:-/usr/bin}
WORK_DIR=$(cd "$(dirname $0)" && pwd)
SRC_DIR="$WORK_DIR/src"

cd $WORK_DIR

if [ ! -x $SRC_DIR/make.sh ]; then chmod a+x $SRC_DIR/make.sh ; fi
$SRC_DIR/make.sh

if [ -f $SRC_DIR/nsattach ]; then /bin/bash -c "\cp -f $SRC_DIR/nsattach $TARGET_DIR" ; fi
if [ -f $SRC_DIR/ssh-container ]; then /bin/bash -c "\cp -f $SRC_DIR/ssh-container $TARGET_DIR" ; fi


