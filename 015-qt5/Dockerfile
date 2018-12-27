FROM dmaugis/tools

# https://github.com/jemc/docker-qt5/blob/master/Dockerfile

# install Qt5
COPY install-qt5.sh /tmp/
RUN  /tmp/install-qt5.sh  
#ENV PATH="/usr/local/Qt/5.11/5.10.1/bin:${PATH}"
#CMD /usr/lib/x86_64-linux-gnu/qt5/examples/opengl/hellogl2
CMD /usr/lib/x86_64-linux-gnu/qt5/examples/opengl/hellogl2/hellogl2





