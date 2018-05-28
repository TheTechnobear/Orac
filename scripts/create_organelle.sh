#/bin/sh
mkdir -p pkg/organelle
cd pkg/organelle
cp -R ../../Core/orac orac
cp -R ../../Organelle/orac/* orac
~/scripts/create_installer.sh orac

