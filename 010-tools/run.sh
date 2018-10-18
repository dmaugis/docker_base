#!/bin/bash
xhost +
nvidia-docker run --rm -it -e "DISPLAY=unix:0.0"  -v /tmp/.X11-unix:/tmp/.X11-unix:rw --privileged dmaugis/tools
