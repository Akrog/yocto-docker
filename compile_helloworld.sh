#!/bin/bash
docker run --rm -v `pwd`/helloworld:/home/sdk/helloworld -w /home/sdk/helloworld -t akrog/yocto:centos7 ./build.sh
