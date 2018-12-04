FROM dmaugis/qt5

COPY install-ceres.sh /tmp/
RUN  /tmp/install-ceres.sh  
RUN  rm /tmp/install-ceres.sh
CMD  /usr/local/bin/ceres/helloworld

