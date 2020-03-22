# YOCTO SDK Container

Dokerfile example for a container image with the Yocto SDK.

Provided scripts are:

- `build.sh`: Silly script to build the container image.
- `sdk/run-sourced.sh`: Script used by the container to source the cross-toolchain environment setup file that provides all necessary environmental variables before running the provided command.  By default it runs a bash script, but we can run other commands as shown in the `compile_helloworld.sh` example.
- `compile_helloworld.sh`: Script to run on the host that uses the built yocto image to cross-compile the `helloworld` example.
- `helloworld/build.sh`: Script to generate required files, cross-compile, and install the example with GNU Autotools.

Container image uses Centos 7 as base image and the generated image can be pulled from `akrog/yocto:centos7`.
