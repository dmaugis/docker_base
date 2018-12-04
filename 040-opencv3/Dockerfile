FROM dmaugis/caffe1

# install opencv3.4.2.sh
COPY install-opencv3.4.2.sh /tmp/
RUN  /tmp/install-opencv3.4.2.sh  
RUN  rm /tmp/install-opencv3.4.2.sh
ADD  info.py info.py
ADD  info.sh info.sh
CMD  ["bash","info.sh"]


