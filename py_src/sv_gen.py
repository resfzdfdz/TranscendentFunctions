

def FileHead():
    emit = \
'''/*******************************************************************************
  Copyright 2019 Xi'an Jiaotong University

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
*******************************************************************************/
'''
    return emit


def build_sv(path, path_lut, module_name, m):
    f = open(path, 'w')
    f.write(FileHead())

##  Generate module name
    s = 'module {n}\n'.format(n = module_name)
    f.writelines(s)
    f.writelines('(\n')    

##  Generate port
    str_1 = '\tinput  logic [{bi}:0]  index,\n'.format(bi = m - 2)
    str_2 = '\toutput logic [23:0] lut_div\n'
    str_3 = ');\n\n'

    f.write(str_1 + str_2 + str_3)

    f.write (pre_lut())
    f.write (lut_part(path_lut))
    f.write (post_lut())

    print ('{mn}.sv Generation Success!\n'.format(mn = module_name) )
    
    f.close()

def pre_lut():
    emit = \
'''always_comb begin
    case (index)
'''
    return emit

def post_lut():
    emit = \
'''\tendcase
end

endmodule
'''
    return emit

def lut_part(path_lut):
    g = open(path_lut, 'r')

    str_lut = g.read()

    return str_lut

if __name__ == '__main__':
    path = './/..//..//hw//LutDiv.sv'
    path_lut = './/lut_u.txt'
    module_name = 'lut_div'

    build_sv(path, path_lut, module_name)
