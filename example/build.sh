#!/bin/bash

INSTALL_DIR=${PWD}/output
BUILD_DIR=${PWD}/build

echo "Arg passed #1: $1"
echo "Arg passed #2: $2"
echo "Arg passed #3: $3"

if [ -d ${INSTALL_DIR} ]
then
	rm -rf ${INSTALL_DIR}
fi

if [ -d ${BUILD_DIR} ]
then
	rm -rf ${BUILD_DIR}
fi

cmake -B${BUILD_DIR} -DCMAKE_INSTALL_PREFIX=${INSTALL_DIR} \
				     -DCMAKE_BUILD_TYPE=Release -S.
cd build
make
make install
