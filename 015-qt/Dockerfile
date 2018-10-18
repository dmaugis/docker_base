FROM dmaugis/tools

# https://github.com/jemc/docker-qt5/blob/master/Dockerfile

# install Qt5
COPY install-qt5.sh /tmp/
RUN  /tmp/install-qt5.sh  
RUN  rm /tmp/install-qt5.sh
RUN  mkdir -p /usr/local/Qt/5.11/5.11.1/lib/fonts/
#RUN  cp /usr/share/fonts/truetype/ttf-dejavu/*.ttf /usr/local/Qt/5.11/5.11.1/lib/fonts/
ENV PATH="/usr/local/Qt/5.11/5.10.1/bin:${PATH}"
CMD /usr/local/Qt/5.11/5.11.1/examples/opengl/hellogl2/hellogl2





