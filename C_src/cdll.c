#include <stdio.h>

unsigned int getFloatBin(float num)
{
    unsigned int *f = (unsigned int*)(&num);
    unsigned int h = *f;

    return h;
}

float getBinFloat(unsigned int num)
{
    float *f = (float*)(&num);
    float h = *f;

    return h;
}

float power(float a, int n)
{
	float s = 1;
	int i;
	for (i = 0; i < n ; i++)
	{
		s = s * a;
	}
	
	return s;
} 

float FastPow(float a, int n, int bitlen)
{
	float s = 1;
	int i;
	int ref;
	for (i = bitlen - 1; i >= 0; i--)
	{
		s = s * s;
		ref = 1 << i;
		if (ref & n)
			s = s * a;
	}
	return s;
}

void test_mul()
{
	float a = 1.6;
	float b = 1.1;
	int n = 15;
	int bitlen = 4;
	
	float c1, c2;
	c1 = power(a, n);
	c2 = FastPow(a, n, bitlen);
	unsigned int cc1, cc2;
	
	cc1 = getFloatBin(c1);
	cc2 = getFloatBin(c2);
	
	printf ("cc1 = %x\n", cc1);
	printf ("cc2 = %x\n", cc2);
}

float TaylorSeries(float a, float b, float u, int n)
{
	float e = 1 - b * u;
	float s = 0;
	
	int i;
	for (i = 0; i < n; i++)
	{
		s = s + power(e, i);
	}
	
	float c = a * u * s;
	
	return c;
}

float reciprocal(float a)
{
    float b = 1 / a;

    return b;
}

float fdiv(float a, float b)
{
    float c = a / b;

    return c;
}

float fmul(float a, float b)
{
    float c = a * b;

    return c;
}


