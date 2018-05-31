#/bin/sh
cd `dirname $0`/..
DIR=`pwd -P`
mkdir -p ${DIR}/pkg/macos
cd ${DIR}/pkg/macos
cp -R ../../Core/* .
cp -R ../../macOS/* .

