#!/bin/bash
docker build -t polaris-client:$image_version --build-arg ssh_prv_key="$(cat id_rsa)" --build-arg ssh_pub_key="$(cat id_rsa.pub)"  .
