# -*- coding: utf-8 -*-
"""
Created on Tue Dec 14 12:36:59 2021

@author: zshaf
"""

import Entropy_Cython
import Entropy_Base

import timeit

L = [1,1,1,1,1]
m = 2
r = 0.06

print('Python Entropy Time:')
print((timeit.timeit(stmt = 'sampen([1,1,1,1,1],2,0.06)',setup ='from Entropy_Base import sampen')))

print('Cython Entropy Time:')
print (timeit.timeit(stmt = 'sampen([1,1,1,1,1],2,0.06)',setup ='from Entropy_Cython import sampen'))