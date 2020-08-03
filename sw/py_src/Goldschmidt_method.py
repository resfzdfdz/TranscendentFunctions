from float2int import *
from hwi import *
import math
import TS6_hw as ts6


def LUT(B, n):
    b_full = B + (24 - n) * '0'
    b_bin = '0' + '01111111' + b_full[1:]
    b_int = int(b_bin, 2)
    b_float = int2float_C(b_int)

    bp_float = reciprocal(b_float)
    bp_bin = float2int_C(bp_float)
    bp_full = '1' + bp_bin[9:]
    bp_lut = '0' + bp_full[:-1]

    b_tailfloat = bintail2float(b_full)
    bp_tailfloat = bintail2float(bp_lut)

    return bp_lut

def Goldschimdt_hwcore(A, B, bitlen, rnd = 5):
    ''' len(A) = len(B) = 24 '''
    
##    r1 = LUT(B[:12], 12)
    B_i = '0' + '01111111' + B[1:]
    B_f = np.float32(int2float_C(int(B_i, 2)))
    r1 = ts6.pseudo_lut(B_f, 9)

    pad00 = (bitlen - 24) * '0'
    pad0  = (bitlen - 25) * '0'
    
    rr = r1 + pad0
    aa = A  + pad00
    bb = B  + pad00
    
    y = hw_mul(bb, rr, bitlen)
    x = hw_mul(aa, rr, bitlen)

    for i in range(rnd - 1):
        ri = bin_inv(y)
        y = hw_mul(y, ri, bitlen)
        x = hw_mul(x, ri, bitlen)

    return x

def Goldschimdt_hw(a, b, rnd = 5):
    aa = float2int_C(a)
    bb = float2int_C(b)

    aa_sig = int(aa[0])
    aa_exp = aa[1:9]
    A = '1' + aa[9:]
    bb_sig = int(bb[0])
    bb_exp = bb[1:9]
    B = '1' + bb[9:]

    bitlen = 50

    UNC = Goldschimdt_hwcore(A, B, bitlen, rnd)
    if (UNC[0] == '0'):
        nc = 1
        C = UNC[2:25]
    else:
        nc = 0
        C = UNC[1:24]

    na = int(aa_exp, 2) - 127
    nb = int(bb_exp, 2) - 127
    ep = na - nb - nc + 127
    
    ep_bin = fig_int(ep, 8)
    sig = bin(aa_sig ^ bb_sig)[2:]

    res = sig + ep_bin + C

    return res


def TaylorSeries(a, b, n):
    B = float2int_C(b)
    B_t = '1' + B[9:]
    
    bb = LUT(B_t[:9], 9)
    
    u = bintail2float(bb)
    e = 1 - b * u

    s = 0
    for i in range(n):
        s += (e ** i)

    c = a * u * s

    return c
    
    
if __name__ == '__main__':
##    a = 0.4
##    b = 4.4
##    n = 8
##
##    B = float2int_C(b)
##    b_tail = '1' + B[:9]
##    b_lut = LUT(b_tail[:9], 9)
##    u = bintail2float(b_lut)
##
##    fmt_a, na = Formal(a)
##    fmt_b, nb = Formal(b)
##
##    cc = fdiv(fmt_a, fmt_b)
##    c1 = int2float_C(int(cc, 2))
##    c2 = TaylorSeries_C(fmt_a, fmt_b, u, n)
##
##    print ('c1 = ', c1)
##    print ('c2 = ', c2)
##    print ('err = ', abs(c1 - c2))
    
    ufp0 = 0
    ufp1 = 0
    ufp2 = 0
    ufp_gt2 = 0
    for i in range(10000):
        e1 = random.random()
        f1 = random.randint(1, 2 ** 120)

        e2 = random.random()
        f2 = random.randint(1, 2 ** 120)

        a = e1 * f1
        b = e2 * f1

        c1 = fdiv(a, b)
        c2 = Goldschimdt_hw(a, b, 3)

##        print ('c2 = ', c2)

        if (c1 != c2):
            c1_int = int(c1, 2)
            c2_int = int(c2, 2)
            if ((c1_int == (c2_int + 1) ) or (c1_int == (c2_int - 1) ) ):
                ufp1 += 1
            elif ((c1_int == (c2_int + 2) ) or (c1_int == (c2_int - 2) ) ) :
                ufp2 += 1
            else:
                ufp_gt2 += 1
        else:
            ufp0 += 1

    print ('ufp0    = ', ufp0)
    print ('ufp1    = ', ufp1)
    print ('ufp2    = ', ufp2)
    print ('ufp_gt2 = ', ufp_gt2)
    
