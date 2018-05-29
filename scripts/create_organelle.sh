#/bin/sh
mkdir -p pkg/organelle
cd pkg/organelle
cp -R ../../Core/* .
cp -R ../../Organelle/* .

~/scripts/create_install_package.sh orac
~/scripts/create_install_package.sh MEC

