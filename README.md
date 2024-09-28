# arm64_cpp_builder
Short help describing how to compile cpp projects for arm64 under amd64 with QEMU emulation.

# QEMU installation and build env
Install the qemu packages:
sudo apt-get install qemu binfmt-support qemu-user-static 

This step will execute the registering scripts:
docker run --rm --privileged multiarch/qemu-user-static --reset -p yes 

Testing the emulation environment:
docker run --rm -t arm64v8/ubuntu:20.04 uname -m

# Creating builder image
Call for Dockerfile inside repository root: 
docker build -t arm64_builder .
