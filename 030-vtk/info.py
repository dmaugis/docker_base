#!/usr/bin/env python

import platform
import os

print("Platform {}".format(platform.platform()))
print("Python v {}".format(platform.python_version()))

from PyQt5 import QtCore; 
print("Successfully installed PyQt v. {}".format(QtCore.PYQT_VERSION_STR))

import vtk
print("Successfully installed vtk v. {}".format(vtk.vtkVersion.GetVTKSourceVersion()))


