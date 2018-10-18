FROM dmaugis/pcl1.8.1 

COPY install-pypcl.sh /tmp/
COPY install-cmake.sh /tmp/
#COPY fix_nogil.patch /tmp/
RUN  /tmp/install-cmake.sh  
RUN  /tmp/install-pypcl.sh  
RUN  rm /tmp/install-pypcl.sh





