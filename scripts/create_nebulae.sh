#/bin/sh
rm -rf pkg/nebulae.old
mv pkg/nebulae pkg/nebulae.old
mkdir -p pkg/nebulae
mkdir -p pkg/nebulae/pd

cd pkg/nebulae
cp ../../Nebulae/deploy.sh .
cp ../../Nebulae/pd/* pd 
cp -R ../../Core/orac pd
cp -R ../../PI/orac pd
cp -R ../../Nebulae/orac pd

#cp -R ../../Core/MEC/* .
cp -R ../../PI/MEC .
cp -R ../../Nebulae/MEC/* MEC

