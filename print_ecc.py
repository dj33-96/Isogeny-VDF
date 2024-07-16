# -*- coding: utf-8 -*-
"""
Created on Mon Jul 15 16:55:07 2024

@author: David1
"""
import os 

from math import log2
from ecc_tb import *

def gcdExtended(a, b): 
    # Base Case 
    if a == 0 : 
        return b,0,1
             
    gcd,x1,y1 = gcdExtended(b%a, a)
     
    # Update x and y using results of recursive 
    # call 
    x = y1 - (b//a) * x1 
    y = x1 
     
    return gcd,x,y 

# ------------------------------------------------------

index = 0 # we provide three different sizes

W_array = [40,89,1506]
P_array = [574448099311,
           501974515280983173562892287,
           1658539334852043956605014686969369842243820155059458240864380460354175875596746126442552006529285980003318752448184629099761975446397870870332614114924526019655624366944770281974501212314250998405682106067115619475132937730960746637418716661215852316737808364060021400361715167852784987427099666051667608448888314571788638487985846716927693574019769274326804364407638203115258648742883949562283207610572974523311143132532016594886767069744238342663307263]


Mem_num = 128 #Number of memory register
Num = int(log2(Mem_num))
W = W_array[index] # prime size
p = P_array[index] # prime
N = 2**(W+3)

gcd,x,y = gcdExtended(p, N)
gcd2,correction,y2 = gcdExtended(N, p)

if ((-x)*p)%N == 1:
    p_prime = x #pp = (-p)^(-1) mod 2**(W+3)
elif ((x)*p)%N == 1:
    p_prime = (-x)%N #pp = (-p)^(-1) mod 2**(W+3)

print("check p_prime:",(-p_prime)*p%N==1)

# ------------------------------------------------------
#For EC function test bench
#boolean to set to true to generate random value.
rand_dbl,rand_4isoc,rand_4isoe = True,True,True
#Input data for the testbench (set rand to false to use this)
#Manually enter the data here
in_dbl = [randint(0,p),randint(0,p),8,4]
in_4isoc = [randint(0,p),randint(0,p)]
in_4isoe = [randint(0,p),randint(0,p),randint(0,p),randint(0,p),randint(0,p)]


# ----- create directory
dir_name = "cryptopro_{}x{}/".format(W,W)
if not(os.path.exists(dir_name)):
    os.mkdir(dir_name)

# ----- print ecc functions
#Standard E(A): y**2 = x**3 + 6*x + x curve
print_dbl_tb(W,p,Num,correction,rand_dbl,in_dbl,dir_name)
print_iso_4_c_tb(W,p,Num,correction,rand_4isoc,in_4isoc,dir_name)
print_iso_4_e_tb(W,p,Num,correction,rand_4isoe,in_4isoe,dir_name)
