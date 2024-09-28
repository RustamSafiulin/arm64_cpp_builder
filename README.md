# arm64_cpp_builder
Short help describing how to compile cpp projects for arm64 under amd64 with QEMU emulation.

# QEMU installation and build env
Install the qemu packages:
```
sudo apt-get install qemu binfmt-support qemu-user-static 
```

This step will execute the registering scripts:
```
docker run --rm --privileged multiarch/qemu-user-static --reset -p yes 
```

Testing the emulation environment:
```
docker run --rm -t arm64v8/ubuntu:20.04 uname -m
```

# Creating builder image
Call for Dockerfile inside repository root: 
```
docker build -t arm64_builder .
```
# Run example compilation inside docker container based on arm64_builder image
```
docker run --rm -v <your root subpath to this repo>/example/:/builder/ --privileged -i arm64_builder
```
In this case BUILD_SCRIPT_DIR env variable inside container will be '.', i.e. 'example' folder and BUILD_SCRIPT_NAME will be 'build.sh' according Dockerfile content 

You also may specify BUILD_SCRIPT_DIR, BUILD_SCRIPT_NAME, BUILD_SCRIPT_ARGS container env variables
```
docker run --rm -v <your root subpath to this repo>/:/builder/ -e BUILD_SCRIPT_DIR=my_example/ -e BUILD_SCRIPT_NAME=./my_build.sh -e BUILD_SCRIPT_ARGS="Debug arm64 TEST_ARG1 TEST_ARG2" --privileged -i arm64_builder
```
