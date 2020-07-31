#! /usr/bin python3 

from float2int import *
from hwi import *

def pseudo_lut(b, n):
    b1 = np.float32(b)
    
    b_int = float2int_C(b)

    b_tail = '1' + b_int[9:]

    ##  b_tail[1:n] is used for Lookup Table
    b_tailround = b_tail[1:n] + (24 - n) * '1' 

    b_roundf = '0' + '01111111' + b_tailround

    b_rff = np.float32(int2float_C(int(b_roundf, 2)))

    one = np.float32(1)

    b_rec = one / b_rff

    b_recint = float2int_C(b_rec)

    ##  Output bitlen can be increased to get higher precision
    b_lut = '01' + b_recint[9:]

    ##  Check if 1 - bu > 0
    gi = int(b_lut, 2) * int(b_tail, 2)
    gc = fig_int(gi, 49)

    if (gc[1] == '1'):
        b_lutres = hw_sub(b_lut, '1', 25)
##        print ('gc = ', gc)
    else:
        b_lutres = b_lut

    return b_lutres

def TS6_hw(a, b, n = 26, m = 9):
    a_int = float2int_C(a)
    b_int = float2int_C(b)

    a_tail = '1' + a_int[9:]
    a_exp  = a_int[1:9]
    a_sig  = a_int[0]

    b_tail = '1' + b_int[9:]
    b_exp  = b_int[1:9]
    b_sig  = b_int[0]

##    n = 50
    pad00 = (n - 24) * '0'
    
    uu = pseudo_lut(b, m) + (n - 25) * '0'
    bb = b_tail + pad00
    aa = a_tail + pad00

    ##  Calculation Step
    one = bin(2 ** (n-1))[2:]

    e  = hw_mul(uu, bb, n)

    ll = hw_sub(one, e, n)

    t1 = hw_add(one, ll, n)     ## 1 + ll

    t2 = hw_mul(ll, ll, n)

    t3 = hw_mul(t2, t2, n)

    t4 = hw_add(t2, t3, n)

    t5 = hw_add(one, t4, n)     ## 1 + ll^2 + ll^4

    t6 = hw_mul(t1, t5, n)      ## (1 + ll)(1 + ll^2 + ll^4)

    t7 = hw_mul(aa, uu, n)

    t8 = hw_mul(t7, t6, n)

##    print ('t8 = ', t8)

    if (t8[0] == '0'):
        t8_remain = t8[1:25]
        t8_cutoff = t8[25:]
        if (t8_cutoff[0] == '1'):
            if (t8_remain == (24 * '1') ):
                t8_res = '1' + 23 * '0'
            else:
                t8_res = hw_add(t8_remain, '1', 24)
        else:
            t8_res = t8_remain
    else:
        t8_remain = t8[:24]
        t8_cutoff = t8[24:]
        if (t8_cutoff[0] == '1'):
            if (t8_remain == (24 * '1') ):
                t8_res = '1' + 23 * '0'
            else:
                t8_res = hw_add(t8_remain, '1', 24)
        else:
            t8_res = t8_remain
    
    return t8_res

def TSn_fullprecision(a, b, n):
    a_int = float2int_C(a)
    b_int = float2int_C(b)

    a_tail = '1' + a_int[9:]
    a_exp  = a_int[1:9]
    a_sig  = a_int[0]

    b_tail = '1' + b_int[9:]
    b_exp  = b_int[1:9]
    b_sig  = b_int[0]

    aa = a_tail + '00'
    bb = b_tail + '00'
    uu = pseudo_lut(b, 9) + '0'

    A = int(aa, 2)
    B = int(bb, 2)
    U = int(uu, 2)

##    n = 6
    index = 50 * n

    E = B * U
    L = 2 ** 50 - E

    TS_sum = 0
    for i in range(n):
        TS_sum += (2 ** (50 * i)) * (L ** (n - 1 - i))

    H = TS_sum * (A * U)

##    print ('H = ', bin(H))

    hstr = bin(H)[2:][:28]

    if (hstr[0] == '1'):
        h1 = hstr[:27]
    else:
        h1 = hstr[1:28]

    h1_remain = h1[:24]
    h1_cutoff = h1[24:]

    if (h1_cutoff[0] == '1'):
        if (h1_remain == (24 * '1') ):
            tails = '1' + 23 * '0'
        else:
            tails = hw_add(h1_remain, '1', 24)
    else:
        tails = h1_remain

    
    
    return tails
    

def rand_float12():
    a = np.float32(random.uniform(0.5, 1))
    b = np.float32(2 * a)
    return b


def print_lut(n, path):
    bitcnt = n - 1

    fp = open(path, 'w')

    for i in range(2 ** bitcnt):
        bitstr = fig(bin(i)[2:], bitcnt)

        h = '0' + '01111111' + bitstr + (24-n) * '1'
        hh = np.float32(int2float_C(int(h, 2)))

        lut_u = pseudo_lut(hh, n)

        wr_str = '\t\t{i}\'b'.format(i = bitcnt) + bitstr + \
                 ': lut_u = {j}\'b'.format(j = 24) \
                 + lut_u[1:] + ';\n'

        fp.write(wr_str)

    fp.close()

    return -1
    
    
if __name__ == '__main__':
    tt = 2 * (10 ** 9)
    ufp0, ufp1, ufp2 = 0, 0, 0
    n = 50
    m = 9

    ufp1_list = []
    ufp2_list = []

##    path = './/lut_u.txt'
##    print_lut(m, path)

    start = time.time()

    for i in range(tt):
        a = rand_float12()
        b = rand_float12()

##        c = TS6_hw(a, b, n, m)
        c   = TSn_fullprecision(a, b, 6)
        c_e = '1' + float2int_C(a/b)[9:]

        if (c == c_e):
            ufp0 += 1
##        elif (abs (int(c, 2) - int(c_e, 2)) == 1):
##            ufp1 += 1
##            ufp1_list.append ( (a, b) )
        else:
            ufp1 += 1
            ufp1_list.append( (a, b) )

    finish = time.time()
    dur = finish - start

    print ('n = ', n)
    print ('m = ', m)
    print ('ufp0 = ', ufp0)
    print ('ufp1 = ', ufp1)
    print ('ufp2 = ', ufp2)
    print ('ELAPSED TIME = {du} s!\n'.format(du = dur))

    # err0 is regular error: (c != c_h) and (c_h == c_e)
    # err1 is precision error: (c_h != c_e)
##    err0, err1 = 0, 0
##
##    for per in ufp1_list:
##        a, b = per
##        
##        c = TS6_hw(a, b, n, m)    
##        c_h = TSn_fullprecision(a, b, 6)
##
##        c_int = '0' + '01111111' + c[1:]
##        c_e = '1' + float2int_C(a/b)[9:]
##
##        if (c_e != c_h):
##            err1 += 1
##        else:
##            if (c != c_h):
##                err0 += 1
##
##    print ('\n')
##    print ('err0 = ', err0)
##    print ('err1 = ', err1)
    

    

