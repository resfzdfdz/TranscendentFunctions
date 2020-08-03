
#include <stdio.h>

unsigned int getFloatBin(float num)
{
    char bin[32];
    unsigned int t = 1;
    unsigned int *f = (int*)(&num);
    int i; 
    for(i = 0; i < 32; i++)
    {
        bin[i] = (*f)&(t<<31-i)?1:0;
    }

    unsigned int h = *f;

    return h;
}


