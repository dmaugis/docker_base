FROM dmaugis/pyqt

# install vtk
COPY install-vtk8.sh /tmp/
RUN  /tmp/install-vtk8.sh  
RUN  rm /tmp/install-vtk8.sh

ENV PYTHONPATH="/usr/local/vtk/8.1/8.1.1/lib/python2.7/site-packages:${PYTHONPATH}"

