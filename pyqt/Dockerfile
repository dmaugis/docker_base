FROM dmaugis/qt

# install pyQt5

COPY LICENSE /
COPY configure.patch /tmp/
COPY sipQtTestQTest.patch /tmp/
COPY install-pyqt5.sh /tmp/
RUN /tmp/install-pyqt5.sh

# Verify installation
RUN python -c 'from PyQt5 import QtCore; print "Successfully installed PyQt v. {}".format(QtCore.PYQT_VERSION_STR);'

RUN rm /tmp/install-pyqt5.sh






