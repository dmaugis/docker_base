#!/bin/bash
xhost +
#nvidia-docker run -it --rm -e "DISPLAY=unix:0.0"  -v /tmp/.X11-unix:/tmp/.X11-unix:rw --privileged  -v $(realpath ./shared):/shared  dmaugis/qt
nvidia-docker run -it --rm -e "DISPLAY=unix:0.0"  -v /tmp/.X11-unix:/tmp/.X11-unix:rw -v $(realpath ./shared):/shared  dmaugis/qt5
