#!/bin/bash/
cd /var/lib/jenkins/workspace/$JOB_NAME
cd kodiak
source build_init
cd conf/
sed -i 's/#MACHINE = "samsung-initial"/MACHINE = "samsung-initial"/g' local.conf
sed -i 's/#VENUS_PRODUCT = "orv-7in"/VENUS_PRODUCT = "orv-7in"/g' local.conf
sed -i 's/SSTATE_DIR/#SSTATE_DIR/g' local.conf
sed -i 's/#EXTRA_IMAGE_FEATURES/EXTRA_IMAGE_FEATURES/g' local.conf
cd ../

bitbake core-image-samsung


