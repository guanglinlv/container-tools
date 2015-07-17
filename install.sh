#!/bin/bash


TARGET_DIR=$1
TARGET_DIR=${TARGET_DIR:-/usr/bin}
WORK_DIR=$(cd "$(dirname $0)" && pwd)
SRC_DIR="$WORK_DIR/src"

cd $WORK_DIR

if [ ! -x $SRC_DIR/make.sh ]; then chmod a+x $SRC_DIR/make.sh ; fi
$SRC_DIR/make.sh
if [ $? != 0 ]; then echo "Invoke $SRC_DIR/make.sh failed,check abover error!" ; exit 1 ; fi

if [ -f $SRC_DIR/nsattach ]; then 
	/bin/bash -c "\cp -f $SRC_DIR/nsattach $TARGET_DIR"
	echo "$(\ls -l $TARGET_DIR/nsattach)"
fi
if [ -f $SRC_DIR/container-enter ]; then 
	/bin/bash -c "\cp -f $SRC_DIR/container-enter $TARGET_DIR"
	echo "$(\ls -l $TARGET_DIR/container-enter)" 
fi
if [ -f $SRC_DIR/container-mount-volumes ]; then 
	/bin/bash -c "\cp -f $SRC_DIR/container-mount-volumes $TARGET_DIR" 
	echo "$(\ls -l $TARGET_DIR/container-mount-volumes)" 
fi


