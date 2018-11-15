FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install -y libcurl4-openssl-dev libssl-dev libjansson-dev automake autotools-dev build-essential gcc-5 g++-5
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 1

RUN apt-get install -y build-essential linux-headers-$(uname -r) wget
RUN wget https://developer.nvidia.com/compute/cuda/10.0/Prod/local_installers/cuda-repo-ubuntu1804-10-0-local-10.0.130-410.48_1.0-1_amd64
RUN dpkg -i cuda-repo-ubuntu1804-10-0-local-10.0.130-410.48_1.0-1_amd64
RUN apt-key add /var/cuda-repo-10-0-local-10.0.130-410.48/7fa2af80.pub
RUN apt-get update
RUN apt-get install -y cuda

WORKDIR /ccminer
COPY . .
RUN ./build.sh
