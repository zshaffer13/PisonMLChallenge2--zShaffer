# -*- coding: utf-8 -*-
"""
Created on Thu Dec  9 17:36:14 2021

@author: zshaf
"""

from setuptools import setup
from Cython.Build import cythonize
import numpy

setup(
    ext_modules = cythonize("Entropy_Cython.pyx",annotate = True),
    include_dirs = [numpy.get_include()]
)