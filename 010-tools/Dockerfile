FROM dmaugis/root

COPY pkg-installed    /usr/local/bin
RUN  pkg-installed           
COPY install-tools.sh /tmp/
RUN  /tmp/install-tools.sh           
CMD ["env"]


