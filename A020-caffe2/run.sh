xhost +
nvidia-docker run -it --rm -v $(realpath ./shared):/shared  dmaugis/caffe2
