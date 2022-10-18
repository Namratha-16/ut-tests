#!/bin/bash/
cd /var/lib/jenkins/workspace/$JOB_NAME
cd kodiak
. ./build_init
cd conf/
sed -i 's/#MACHINE = "polaris-9210"/MACHINE = "polaris-9210"/g' local.conf
sed -i 's/#VENUS_PRODUCT = "orv-7in"/VENUS_PRODUCT = "orv-7in"/g' local.conf
sed -i 's/SSTATE_DIR/#SSTATE_DIR/g' local.conf
#sed -i 's/DL_DIR/#DL_DIR/g' local.conf
#echo "DL_DIR=/home/jenkins/work/downloads" >local.conf
#sed -i 's/#EXTRA_IMAGE_FEATURES/EXTRA_IMAGE_FEATURES/g' local.conf
cd ../

bitbake venus


