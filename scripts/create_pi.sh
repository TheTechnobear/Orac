#/bin/sh
rm -rf pkg/pi.old
mv pkg/pi pkg/pi.old
mkdir -p pkg/pi
cd pkg/pi
cp -R ../../Core/* .
cp -R ../../PI/* .

