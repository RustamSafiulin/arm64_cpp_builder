FROM arm64v8/ubuntu:20.04

WORKDIR /builder/

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update --allow-insecure-repositories && \ 
    apt-get install -y build-essential make cmake gcc g++

RUN apt-get install -y apt-transport-https ca-certificates curl software-properties-common

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

RUN add-apt-repository "deb [arch=arm64] https://download.docker.com/linux/ubuntu focal stable"
RUN apt-get install -y docker-ce

ENV BUILD_SCRIPT_DIR .
ENV BUILD_SCRIPT_NAME ./build.sh
ENV BUILD_SCRIPT_ARGS "Release arm64"

CMD ["sh", "-c", "cd ${BUILD_SCRIPT_DIR}; ${BUILD_SCRIPT_NAME} ${BUILD_SCRIPT_ARGS}"]

