FROM nvidia/cudagl:9.2-devel-ubuntu16.04 

RUN apt-key update && apt-get update \
    && apt-get install -y git wget curl pkg-config \
    && rm -rf /var/lib/apt/lists/*

# cuda-samples-9.2

# install cudnn
ENV CUDNN_VERSION 7.1.4.18
LABEL com.nvidia.cudnn.version="${CUDNN_VERSION}"
RUN apt-get update && apt-get install -y --no-install-recommends \
            libcudnn7=$CUDNN_VERSION-1+cuda9.2 \
            libcudnn7-dev=$CUDNN_VERSION-1+cuda9.2 


