FROM dmaugis/root

COPY pkg-installed    /usr/local/bin
RUN  pkg-installed           
COPY install-tools.sh /tmp/
RUN  /tmp/install-tools.sh  
RUN  rm /tmp/install-tools.sh
RUN  pkg-installed           
CMD ["env"]


