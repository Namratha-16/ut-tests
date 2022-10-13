#!/bin/bash
docker build -t polaris-slave-test --build-arg ssh_prv_key="$(cat id_rsa)" --build-arg ssh_pub_key="$(cat id_rsa.pub)"  .
