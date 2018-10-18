FROM dmaugis/python

# install pyQt5
COPY LICENSE /
COPY configure.patch /tmp/
COPY sipQtTestQTest.patch /tmp/
COPY install-pyqt5.sh /tmp/
RUN /tmp/install-pyqt5.sh
RUN rm /tmp/install-pyqt5.sh
RUN rm /tmp/*.patch
ADD  info.py info.py
CMD ["./info.py"]






