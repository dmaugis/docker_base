FROM dmaugis/tesseract

COPY install-caffe1.sh /tmp/
RUN  /tmp/install-caffe1.sh  
RUN  rm /tmp/install-caffe1.sh
RUN  env
ADD  info.py info.py
ADD  info.sh info.sh
CMD  ["bash","info.sh"]









