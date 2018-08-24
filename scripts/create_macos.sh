#/bin/sh
cd `dirname $0`/..
DIR=`pwd -P`
rm -rf ${DIR}/pkg/macos.old
mv ${DIR}/pkg/macos ${DIR}/pkg/macos.old
mkdir -p ${DIR}/pkg/macos
cd ${DIR}/pkg/macos
cp -R ../../Core/* .
cp -R ../../macOS/* .

