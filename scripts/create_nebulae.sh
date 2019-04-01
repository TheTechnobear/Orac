#/bin/sh
rm -rf pkg/nebulae.old
mv pkg/nebulae pkg/nebulae.old
mkdir -p pkg/nebulae
mkdir -p pkg/nebulae/instr

cd pkg/nebulae
cp ../../Nebulae/instr/* instr 
cp -R ../../Core/Orac instr
cp -R ../../PI/Orac instr
cp -R ../../Nebulae/Orac instr

#cp -R ../../Core/MEC/* .
cp -R ../../PI/MEC .
#cp -R ../../Nebulae/MEC/* MEC

