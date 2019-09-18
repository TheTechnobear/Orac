#/bin/bash
ARG=`echo $1 | tr -d '/' `
MEC_DIR=$ARG/MEC
ORAC_DIR=$ARG/orac

if [ "$ARG" == "Organelle" ] 
then
	MEC_DIR="${MEC_DIR}/MEC"
fi

echo cp '../MEC/build/release/bin/*' ${MEC_DIR}
echo cp '../MEC/build/release/lib/*' ${MEC_DIR}
echo cp '../MEC/build/release/lib/*' ${ORAC_DIR}/externals
cp ../MEC/build/release/bin/* ${MEC_DIR}
cp ../MEC/build/release/lib/* ${MEC_DIR}
cp ../MEC/build/release/lib/* ${ORAC_DIR}/externals

