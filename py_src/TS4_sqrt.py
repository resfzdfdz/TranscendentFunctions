
from FloatObject import *

def lut_w(b, n):
    b_sqrttail = b.BinSqrtTail()

    b_upbound = b_sqrttail[:n] + (25 - n) * '1'

    t1 = FloatObj.SqrtTail2Float(b_upbound)

    t2 = t1.sqrt()

    t3 = t2.BinTail()

    t4 = '0' + t3     ## fig to 25 bit and move point

    w = '0' + t4[:24] ## w approximate to sqrt(B) / 2

    assert (int(w, 2) < int(b_sqrttail, 2)), 'W < sqrt(B)/2 Exception Raise!'

    return w

def lut_v(b, n):
    
    
    return 0

def TS6_sqrt_hw(a, b, n, m):

    return 0


def TS6_sqrt_fullprecision(a, b, k):

    return 0

def rand_float12():
    a = np.float32(random.uniform(0.5, 1))
    b = np.float32(2 * a)
    return b

if __name__ == '__main__':
    tt = 2 ** 24

    for i in range(tt):
        b = FloatObj(rand_float12())
        lut_w(b, 9)
