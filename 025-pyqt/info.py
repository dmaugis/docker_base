#!/usr/bin/env python

import platform
import os

print(platform.platform())
print(platform.python_version())
print(os.getuid())

from PyQt5 import QtCore; 

print("Successfully installed PyQt v. {}".format(QtCore.PYQT_VERSION_STR))

