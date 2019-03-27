#/bin/sh
rm -rf pkg/salt.old
mv pkg/salt pkg/salt.old
mkdir -p pkg/salt
cd pkg/salt
cp -R ../../Core/* .
cp -R ../../Bela/* .
cp -R ../../Salt/* .

