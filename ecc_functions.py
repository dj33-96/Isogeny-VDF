# -*- coding: utf-8 -*-
"""
Created on Mon Jul  1 21:11:54 2024

@author: David1
"""
from copy import copy
from random import random


def dbl(x,z,a,c,p,correction) :
    """
    Return R = 2*[P], in XZ Montgomery.
    """
    t0 = (x - z)%p
    t1 = (x + z)%p
    t0b = (t0**2 * correction)%p
    t1b = (t1**2 * correction)%p
    z2 = (c * t0b * correction)%p
    x2 = (z2 * t1b * correction)%p
    t1 = (t1b - t0b)%p
    t0 = (a * t1 * correction)%p
    z2 = (z2 + t0)%p
    z2 = (z2 * t1 * correction)%p
    return x2, z2

def iso_4_c(x,z,p,correction) :
    """
    Return R = 2*[P], in XZ Montgomery.
    """
    k2 = (x - z)%p
    k3 = (x + z)%p
    k1 = (z**2 * correction)%p
    k1 = (k1 + k1)%p
    c = (k1**2 * correction)%p
    k1 = (k1 + k1)%p
    a = (x**2 * correction)%p
    a = (a + a)%p
    a = (a**2 * correction)%p
    return a,c,k1,k2,k3

def iso_4_e(x,z,k1,k2,k3,p,correction):
    """ 
    Evaluation of the 4-isogeny on a point P.
    """
    #Computation
    t0 = (x + z)%p
    t1=(x - z)%p
    xq = (t0 * k2 * correction)%p
    zq = (t1 * k3 * correction)%p
    t0 = (t0 * t1 * correction)%p
    t0 = (t0 * k1 * correction)%p
    t1 = (xq + zq)%p
    zq = (xq - zq)%p
    t1 = (t1 ** 2 * correction)%p
    zq = (zq ** 2 * correction)%p
    xq = (t0 + t1)%p
    t0 = (zq - t0)%p
    xo = (xq * t1 * correction)%p
    zo = (zq * t0 * correction)%p
    return xo,zo
