import numpy as np
from float2int import *
from hwi import *

class FloatObj:
    def __init__(self, FloatObj):
        self.float32 = np.float32(FloatObj)
        self.tail = np.float32(int2float_C(int('001111111' + self.BinRepresent()[9:], 2)))
        self.exp = int(self.BinRepresent()[1:9], 2) - 127
        self.signal = int(self.BinRepresent()[0], 2)

    def __eq__(self, other):
        return self.BinRepresent() == other.BinRepresent()

    def __add__(self, other):
        return self.float32 + other.float32

    def __sub__(self, other):
        return self.float32 - other.float32

    def __mul__(self, other):
        return FloatObj(self.float32 * other.float32)

    def __truediv__(self, other):
        a = self.float32
        b = other.float32
        return FloatObj(a/b)

    def sqrt(self):
        return FloatObj(np.sqrt(self.float32))
    
    def BinRepresent(self):
        return float2int_C(self.float32)

    def Bin2Float(bp):
        return FloatObj( int2float_C( int(bp, 2) ) )

    def BinTail(self):
        return '1' + self.BinRepresent()[9:]

    def Tail2Float(bt):
        bin_tail = '0' + '01111111' + bt[1:]
        int_tail = int(bin_tail , 2)
        return FloatObj( int2float_C(int_tail) )

    def BinSqrtTail(self):
        if (self.exp & 1):
            bst = self.BinTail() + '0'
        else:
            bst = '0' + self.BinTail()
        return bst

    def SqrtTail2Float(bst):
        if (bst[0] == '1'):
            tail = bst[1:-1]
            exp = '10000000'
        elif (bst[1] == '1'):
            tail = bst[2:]
            exp = '01111111'
        else:
            tail = bst[3:] + '0'
            exp = '01111110'
            
        bin_x = '0' + exp + tail
        int_x = int(bin_x, 2)

        return FloatObj(int2float_C(int_x))
