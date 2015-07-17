#!/bin/bash

WORK_DIR=$(cd "$(dirname $0)" && pwd)
SRC_DIR="$WORK_DIR"

[ -f $SRC_DIR/importenv.c ] && {
	cd $SRC_DIR
#	echo "compiling importenv"
	rm -rf importenv > /dev/null 2>&1
#	make LDFLAGS=-static CFLAGS=-Wall importenv 
#	gcc -s -static -o importenv -xc importenv.c
	if [ $? != 0 ]; then exit 1 ; fi
	chmod a+x $SRC_DIR/importenv > /dev/null 2>&1
} 

[ -f $SRC_DIR/nsattach.c ] && {
        cd $SRC_DIR     
#	echo "compiling nsattach"
	rm -rf nsattach > /dev/null 2>&1
	make LDFLAGS=-static CFLAGS=-Wall nsattach
#	gcc -s -static -o nsattach -xc nsattach.c
	if [ $? != 0 ]; then exit 1 ; fi
	chmod a+x $SRC_DIR/nsattach > /dev/null 2>&1
}

[ -f $SRC_DIR/container-enter ] && {
	chmod a+x $SRC_DIR/container-enter > /dev/null 2>&1
}

[ -f $SRC_DIR/container-mount-volumes ] && {
        chmod a+x $SRC_DIR/container-mount-volumes > /dev/null 2>&1
}
