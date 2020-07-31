from ctypes import *
import numpy as np
import random
import time

ll = cdll.LoadLibrary
lib = ll('.//lib//cdll.so')
lib.getFloatBin.restype = c_uint32
lib.getBinFloat.restype = c_float
lib.reciprocal.restype = c_float
lib.fmul.restype = c_float
lib.fdiv.restype = c_float
lib.power.restype = c_float
lib.TaylorSeries.restype = c_float


####   Use C to change numbers   ###
def test_mul():
    lib.test_mul()


def TaylorSeries_C(a, b, u, n):
    aa = c_float(a)
    bb = c_float(b)
    uu = c_float(u)
    nn = c_int (n)

    c = lib.TaylorSeries(aa, bb, uu, nn)

    return c

def power(a, n):
    aa = c_float(a)
    nn = c_int(n)

    c = lib.power(aa, nn);

    return c

def fdiv(A, B):
    a = c_float(A)
    b = c_float(B)

    c = lib.fdiv(a, b)
    cc = float2int(c)

    return cc

def fmul(A, B):
    a = c_float(A)
    b = c_float(B)

    c = lib.fmul(a, b)
    cc = float2int_C(c)

    return cc
    

def tail2float(A):
    h = int(A, 2) * (2 ** -23)

    return h

def reciprocal(a):
    A = c_float(a)
    B = lib.reciprocal(A)

    return B
    

def float2int_C(A):
    a = c_float(A)

    b = lib.getFloatBin(a)

    b_bin = bin(b)[2:]
    b_zero = 32 - len(b_bin)
    b_align = b_zero * '0' + b_bin

    return b_align

def int2float_C(A):
    a = c_uint32(A)

    b = lib.getBinFloat(a)

    return b












####   Use python to change numbers   ####
def int2float(A):
    a_bin = bin(A)[2:]
    a_zero = 32 - len(a_bin)
    a_align = a_zero * '0' + a_bin

    sig_a = int(a_align[0], 2)
    exp_a = int(a_align[1:9], 2)
    frac_a = int(a_align[9:], 2)

    ft = ( (-1) ** (sig_a) ) * (2 ** (exp_a - 127)) * (1 + frac_a * 2 ** -23)

    return ft

def float2int(A):
    signal = (A < 0)
    sig_bin = bin(signal)[2:]
    
    fmt_a, m = Formal(A)

    exponent = m + 127
    frac_recover = (fmt_a - 1) * 2 ** 23
    frac = round(frac_recover)

    ex_bin = bin(exponent)[2:]
    ex_zero = 8 - len(ex_bin)
    ex_align = ex_zero * '0' + ex_bin

    frac_bin = bin(frac)[2:]
    frac_zero = 23 - len(frac_bin)
    frac_align = frac_zero * '0' + frac_bin

##    return sig_bin , ex_align , frac_align
    return sig_bin + ex_align + frac_align

def Formal(A):
    if (1 <= A < 2):
        return A, 0
    elif (A >= 2):
        A = A / 2
        (fmt_m, n) = Formal(A)
        n = n + 1
        return fmt_m, n
    elif (A < 1):
        A = A * 2
        (fmt_m, n) = Formal(A)
        n = n - 1
        return fmt_m, n

def bintail2float(r):
    lr = len(r)

    s = 0
    for i in range(lr):
        s += int(r[i]) * 2 ** (-i)

    return s

def tail2ieee754(r):
    sig = '0'
    exp = '01111111'

    ieee754 = sig + exp + r[1:]

    return ieee754


##    Test Bench   ##
if __name__ == '__main__':
    a = 0
