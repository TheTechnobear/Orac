#/bin/sh
rm -rf pkg/bela.old
mv pkg/bela pkg/bela.old
mkdir -p pkg/bela
cd pkg/bela
cp -R ../../Core/* .
cp -R ../../Bela/* .

