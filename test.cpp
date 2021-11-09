#include <booster/booster.h>
#include <booster/sgeconv.h>
#include <booster/helper.h>

// #include <immintrin.h>
#include <arm_neon.h>
#include <string.h>
#include <assert.h>
#include <stdio.h>

namespace booster
{
int align_ceil(int num, int align)
{
    return num + (align - (num % align)) % align;
}

