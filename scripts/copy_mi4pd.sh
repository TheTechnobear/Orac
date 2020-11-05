#/bin/bash
ARG=`echo $1 | tr -d '/' `
ORAC_DIR=$ARG/orac

echo cp '../Mi4Pd/build/release/lib/*' ${ORAC_DIR}/externals
cp ../Mi4Pd/build/release/lib/* ${ORAC_DIR}/externals

