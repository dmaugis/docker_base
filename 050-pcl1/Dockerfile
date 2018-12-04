FROM dmaugis/opencv3

# install install-pcl1.8.1.sh
COPY install-pcl1.8.1.sh /tmp/
RUN  /tmp/install-pcl1.8.1.sh  
RUN  rm /tmp/install-pcl1.8.1.sh
ADD  info.py info.py
ADD  info.sh info.sh
CMD  ["bash","info.sh"]



