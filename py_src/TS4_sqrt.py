
from FloatObject import *
from sv_gen import *

def lut_z(b, n):
    B = b.BinSqrtTail()

    b_upbound = B[:n] + (25 - n) * '1'

    t1 = FloatObj.SqrtTail2Float(b_upbound)

    t2 = FloatObj(1) / t1.sqrt()

    t3 = t2.BinTail()

    t4 = '00' + t3[:23]

    Z = t4

    return Z

def lut_z3(b, n):
    Z = lut_z(b, n)

    t1 = hw_sqrt_mul(Z, Z, 25)

    z3= hw_sqrt_mul(t1, Z, 25)

    return z3
    

def TS4_sqrt_hw(b, n = 28, m = 9):
    '''Hardware implementation of Taylor 4 float sqrt'''

    ##  Float --> Extended Int
    bb = b.BinSqrtTail()
    zz = lut_z(b, m)
    z3 = lut_z3(b, m)

    pad = (n - 25) * '0'

    B = bb + pad
    Z = zz + pad
    Z3 = z3 + pad

    ##  Calculation Step 1
    one = '01' + (n - 2) * '0'
    thr = '11' + (n - 2) * '0'

    t1 = hw_add (Z, Z[1:] + '0', n)   ##  t1 = 3Z
    t2 = hw_sqrt_mul (B, Z3, n)       ##  t2 = B * Z3                    mul1
    t3 = hw_sub (t1, t2, n)           ##  t3 = (3Z - B * Z3)
    t4 = '0' + t3[:-1]                ##  t4 = (1/2) * t3 ( = x1)
    t5 = hw_sqrt_mul (B, t4, n)       ##  t5 = B * x1 ( = y1)            mul2
    t6 = hw_sqrt_mul (t4, t5, n)      ##  t6 = t4 * t5 ( = x1 * y1)      mul3
    t7 = hw_sub (thr, t6, n)          ##  t7 = 3 - t6 ( = 3 - x1 * y1)
    t8 = hw_sqrt_mul (t5, t7, n)      ##  t8 = y1 * t7                   mul4
    v = '0' + t8[:-1]                 ##  v  = (1/2) * t8

#    for i in range(2):
#        t1 = hw_sqrt_mul(Z, Z, n)
#        t2 = hw_sqrt_mul(t1, B, n)
#        t3 = hw_sub(thr, t2, n)
#        t4 = hw_sqrt_mul(Z, t3, n)
#        Z = '0' + t4[:-1]

#    v = hw_sqrt_mul(Z, B, n)
    r = v[:25]

    ##  Tuckerman Rounding Test
    R = int(r, 2)
    X = int(bb, 2) << 23
    
    if (X > (R * R + R)):
        R = R + 1
    elif (X < (R * R - R)):
        R = R - 1
    else:
        R = R

    final = bin(R)[2:]

    final_res = final
   
    return final_res


def TS6_sqrt_fullprecision(b):
    '''Full Precision Square Root Taylor Series 6 Algorithm'''

    B = int(b.BinSqrtTail(), 2)
    Y = int(lut_y(b, m), 2)
    X = int(lut_x(b, m), 2)
##    L = int(lut_l(b, m), 2)
    L = 2 ** 46 - B * X

##    print ('L = ', L)

    index = 2 ** (-23 * 11)

    coef = [256, -128, -32, -16, -10, -7]

    S = 0
    for i in range(len(coef)):
        S += coef[i] * (L ** i) * 2 ** (46 * (5 - i))

    T = S * Y
    
    final = bin(T)[2:]
    final_remain = final[:24]
    final_cutoff = final[24:]

    if (final_cutoff[0] == '1'):
        final_res = hw_add(final_remain, '1', 24)
    else:
        final_res = final_remain

##    final_res = final_remain
    
    return final_res

def print_lut(n, path1, path2):
    f1 = open(path1, 'w')
    f2 = open(path2, 'w')
    
    for i in range(2 ** n):
        bitstr = fig_int(i, n)

        if (bitstr[0] == '0'):
            B = '1'  + bitstr[1:]   + (25 - n) * '1'
        else:
            B = '01' + bitstr[1:-1] + (25 - n) * '1'

        b = FloatObj.SqrtTail2Float(B)

        z  = lut_z (b, n)
        z3 = lut_z3(b, n)

        str_z  = f'\t\t{n}\'b{bitstr}:\tlut_value = 25\'b{z};\n'
        str_z3 = f'\t\t{n}\'b{bitstr}:\tlut_value = 25\'b{z3};\n'

        f1.writelines (str_z)
        f2.writelines (str_z3)

    f1.close()
    f2.close()


def rand_float14():
    a = np.float32(random.uniform(0.25, 1))
    b = np.float32(4 * a)
    return b

if __name__ == '__main__':
    tt = 2 ** 10
    ufp0, ufp1, ufpm1, ufp2 = 0, 0, 0, 0
    n, m = 28, 8

    ufp1_list, ufp2_list = [], []
    
    print ('Hardware Simulation Start!')
    print ('Test Pattern Num = {tp} \n'.format(tp = tt))

    print ('Calculating LookUp-Table:')
    name1 = 'LutZ'
    name2 = 'LutZ3'
    path1 = f'.//luts//{name1}.txt'
    path2 = f'.//luts//{name2}.txt'
    print_lut(m, path1, path2)

    ps1   = f'.//luts//{name1}.sv'
    ps2   = f'.//luts//{name2}.sv'
    build_sv (ps1, path1, name1, m)
    build_sv (ps2, path2, name2, m)
##    build_sv(path, path_lut, module_name, m)    

    start = time.time()

    for i in range(tt):
        b = FloatObj(rand_float14())

        c = TS4_sqrt_hw(b, n, m)
##        c = TS6_sqrt_fullprecision(b)
        c_e = b.sqrt().BinTail()

        if (c == c_e):
            ufp0 += 1
        elif ( (int(c, 2) - int(c_e, 2)) == 1):
            ufp1 += 1
            ufp1_list.append (b)
        elif ( (int(c_e, 2) - int(c, 2)) == 1):
            ufpm1 += 1
            ufp1_list.append (b)
        else:
            ufp2 += 1
            ufp2_list.append (b)

    finish = time.time()
    dur = finish - start

    print ('\n')
    print ('Hardware Parameters:')
    print ('n =', n)
    print ('m = {mm} \n'.format(mm = m))

    print ('Simulation Errors:')
    print ('ufp0  =', ufp0)
    print ('ufp1  =', ufp1)
    print ('ufpm1 =', ufpm1)
    print ('ufp2  = {u2} \n'.format(u2 = ufp2) )
    
    print ('ELAPSED TIME = {du} s!\n'.format(du = dur))

    fp = open('Non-Equal.txt', 'w')
    for per in ufp1_list:
        b = per
        char_b = str(b.float32)
        wr_str = char_b + '\n'
        fp.writelines(wr_str)

    fp.writelines('\n\n\n********  UPF2  ********\n\n\n')

    for per in ufp2_list:
        b = per
        char_b = str(b.float32)
        wr_str = char_b + '\n'
        fp.writelines(wr_str)

    fp.close()
    

