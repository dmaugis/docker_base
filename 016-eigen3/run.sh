#!/bin/bash
nvidia-docker run -it --rm -e "DISPLAY=unix:0.0"  -v /tmp/.X11-unix:/tmp/.X11-unix:rw  dmaugis/eigen3