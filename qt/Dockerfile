FROM dmaugis/base

# https://github.com/jemc/docker-qt5/blob/master/Dockerfile


# install Qt5
COPY install-qt5.sh /tmp/
RUN  /tmp/install-qt5.sh  
RUN  rm /tmp/install-qt5.sh
ENV PATH="/usr/local/Qt/5.11/5.11.1/bin:${PATH}"





