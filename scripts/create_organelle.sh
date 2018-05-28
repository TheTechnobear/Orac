#/bin/sh
mkdir -p pkg
cd pkg
cp -R ../Core/orac orac
cp -R ../Organelle/orac/* orac
~/scripts/create_installer.sh orac

