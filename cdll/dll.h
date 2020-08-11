#ifndef _DLL_H_
#define _DLL_H_

#if BUILDING_DLL
#define DLLIMPORT __declspec(dllexport)
#else
#define DLLIMPORT __declspec(dllimport)
#endif

DLLIMPORT float FloatSqrtRoot (float b);

DLLIMPORT float FloatSin (float b);

DLLIMPORT float FloatCos (float b);

DLLIMPORT unsigned int getFloatBin(float num);

DLLIMPORT float getBinFloat(unsigned int num);

DLLIMPORT float reciprocal(float a);

DLLIMPORT float fmul(float a, float b);

DLLIMPORT float fdiv(float a, float b);

DLLIMPORT float TaylorSeries(float a, float b, float u, int n);

DLLIMPORT float power(float a, int n);

DLLIMPORT float FastPow(float a, int n, int bitlen);

DLLIMPORT void test_mul();

DLLIMPORT void HelloWorld();

#endif
