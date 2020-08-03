import numpy as np
from float2int import *
from hwi import *

class FloatObj:
    def __init__(self, FloatObj):
        self.float32 = np.float32(FloatObj)
        self.tail = np.float32(int2float_C(int('001111111' + self.BinRepresent()[9:], 2)))
        self.exp = int(self.BinRepresent()[1:9], 2) - 127
        self.signal = int(self.BinRepresent()[0], 2)

    def BinRepresent(self):
        return float2int_C(self.float32)

    def __eq__(self, other):
        return self.BinRepresent() == other.BinRepresent()

    def __mul__(self, other):
        return FloatObj(self.float32 * other.float32)

        

