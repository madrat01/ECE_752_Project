#include <stdio.h>
#include <iostream>
#include <gem5/m5ops.h>

const int ASIZE = 2048;
const int STEP = 256;
const int ITERS = 32;

int main() {
   int N=10000;
   int t = 0;
   m5_dump_reset_stats(0, 0);
    for(int iter=0; iter < ITERS; ++iter) {
        for(int i=0; i < STEP; i+=1) {
            if(i<0)  {
                t+=3+3*t;
            } else {
                t-=1-5*t;
            }
        }
    }
    m5_dump_reset_stats(0, 0);
    std::cout<<"CCa Result: "<<t<<std::endl;
}
