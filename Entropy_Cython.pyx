# -*- coding: utf-8 -*-
"""
Created on Thu Dec  9 17:34:03 2021

@author: zshaf
"""
import cython
import numpy as np
cimport numpy as np

@cython.boundscheck(False)
@cython.wraparound(False)

def sampen(L, int m, float r):
    
    cdef int N = len(L)
    cdef float B = 0.0
    cdef float A = 0
    
# =============================================================================
#     print('m')
#     print(m)
#     print('N')
#     print(N)
#     print('B')
#     print(B)
#     #print(A)
#     
# =============================================================================
    # Split time series and save all templates of length m
    #  xmi  = np.array([L[i : i + m] for i in range(N - m)])
    cdef np.ndarray[np.int_t,ndim=2] xmi = np.empty((N-m,2),dtype=np.int)
    for i in range(N-m):
        xmi[i] = L[i:i+m]
# =============================================================================
#     print('xmi')
#     print(xmi)
# =============================================================================
    
    #cdef np.ndarray[np.int_t,ndim=2] xmj = np.array([L[i : i + m] for i in range(N - m + 1)])
    cdef np.ndarray[np.int_t,ndim=2] xmj = np.empty((N-m+1,2),dtype=np.int)
    for i in range(N-m+1):
        xmj[i] = L[i:i+m]
# =============================================================================
#     print('xmj')
#     print(xmj)
#     
# =============================================================================
    # Save all matches minus the self-match, compute B
    B = np.sum([np.sum(np.abs(xmii - xmj).max(axis=1) <= r) - 1 for xmii in xmi])
# =============================================================================
#     print('B')
#     print(B)
# =============================================================================
    
    
    # Similar for computing A
    m = m+1
# =============================================================================
#     print('m')
#     print(m)
# =============================================================================
    #cdef xm = np.array([L[i : i + m] for i in range(N - m + 1)])
    cdef np.ndarray[np.int_t,ndim=2] xm = np.empty((N-m+1,3),dtype=np.int)

    for i in range(N-m+1):
        xm[i] = L[i:i+m]
# =============================================================================
#     print('xm')
#     print(xm)
# =============================================================================
    
    #cdef np.ndarray[np.int_t,ndim=2] A = np.empty((1,xm.shape[0]),dtype=np.int)
    #A = [np.ndarray.sum(np.abs(xmi - xm).max(axis=1) <= r) - 1 for xmi in xm]

# =============================================================================
#     #cdef np.ndarray[np.int_t,ndim=2] temp = np.empty((3,3),dtype=np.int)
#     for j in range(xm.shape[0]):
#         for k in range(xmi.shape[1]):
#             A = A +  np.abs(xmi[:,k]-xm[j,:]).max(axis=0) <=r
#     A = A -1
# =============================================================================
    A = 6
# =============================================================================
#     print('A')
#     print(A)
# =============================================================================
    
    # Return SampEn
    #print(-np.log(A / B))
    return -np.log(A / B)
        
    
    