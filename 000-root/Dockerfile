FROM nvidia/cudagl:9.2-devel-ubuntu16.04

# install cudnn
ENV CUDNN_VERSION 7.1.4.18
LABEL com.nvidia.cudnn.version="${CUDNN_VERSION}"
RUN    apt-get update \
    && apt-get install -y --no-install-recommends \
            libcudnn7=$CUDNN_VERSION-1+cuda9.2 \
            libcudnn7-dev=$CUDNN_VERSION-1+cuda9.2 \
            glmark2 \
    && rm -rf /var/lib/apt/lists/*

# some packages (tensorflow?) have trouble linking if libcuda.so.1 is not found
RUN ln -s /usr/lib/x86_64-linux-gnu/libcuda.so.396.44 /usr/local/cuda-9.2/targets/x86_64-linux/lib/libcuda.so
RUN ln -s /usr/lib/x86_64-linux-gnu/libcuda.so.396.44 /usr/local/cuda-9.2/targets/x86_64-linux/lib/libcuda.so.1
RUN ln -s /usr/lib/x86_64-linux-gnu/libcuda.so.396.44 /usr/local/cuda-9.2/targets/x86_64-linux/lib/libcuda.so.396.44

# runtime: test opengl
CMD glmark2
