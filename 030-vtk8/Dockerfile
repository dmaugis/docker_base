FROM dmaugis/pyqt5

# install vtk
#ADD  17350.patch /tmp/
#COPY vtkPythonWrapping.cmake /tmp/
COPY install-vtk8.sh /tmp/
RUN  /tmp/install-vtk8.sh  
RUN  rm /tmp/install-vtk8.sh
#ENV  LD_LIBRARY_PATH=/usr/local/vtk/8.1/8.1.1/lib/:$LD_LIBRARY_PATH
#ENV  LD_LIBRARY_PATH=/usr/local/Qt/5.11/5.11.1/lib/:$LD_LIBRARY_PATH
#RUN  env
ADD  info.py info.py
ADD  info.sh info.sh
ADD  CylinderExample.py CylinderExample.py
CMD  ["bash","info.sh"]

