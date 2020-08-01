
def fig(s, n):
    s_zero = n - len(s)
    r = s_zero * '0' + s

    return r

def fig_int(a, n):
    a_bin = bin(a)[2:]
    a_zero = n - len(a_bin)
    a_align = a_zero * '0' + a_bin

    return a_align

def bin_inv(s):
    r = ''
    for per in s:
        if (per == '1'):
            r += '0'
        else:
            r += '1'

    r_int = int(r, 2)
    rb_int = r_int + 1

    t = fig_int(rb_int, len(s))
    
    return t

##def bin_comp(s, n = 26):
##    s_inv = bin_inv(s)
##    s_comp = hw_add(s_inv, '1', n)
##
##    return s_comp

def hw_add(a, b, n = 26):
    ai = int(a, 2)
    bi = int(b, 2)

    ci = ai + bi

    if (ci >= 2 ** n):
        ci = ci - 2 ** n

    c = fig_int(ci, n)

    return c

def hw_sub(a, b, n):
    ai = int(a, 2)
    bi = int(b, 2)

    ci = ai - bi

    c = fig_int(ci, n)

    return c

def hw_mul(a, b, n = 26):
    assert len(a) == n, 'Data a Length Error'
    assert len(b) == n, 'Data b Length Error'

    a_int = int(a, 2)
    b_int = int(b, 2)
    c_int = a_int * b_int

    c_align = fig_int(c_int, 2* n)

    c_remain = c_align[1:n+1]
    c_cutoff = c_align[n+1:]

#    if (c_cutoff[0] == '1'):
#        c_res = hw_add(c_remain, '1', n)
#    else:
#        c_res = c_remain

    return c_remain


