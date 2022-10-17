#include <math.h>
#include "pav_analysis.h"
#include <stdio.h>

#define PI 3.14159265359

float compute_power(const float *x, unsigned int N) {
    float power=0.0;
    float res=0.0;
    int i;

    for (i=0;i<N;i++){
        res = res + x[i]*x[i];
    }

    power = 10*log10(res/N);
    return power;
}


float compute_am(const float *x, unsigned int N) {
    float am=0.0;
    float res=0.0;
    int i;

    for(i=0;i<N;i++){
        res = res + fabs(x[i]);
    }

    am = res/N;

    return am;
}


float compute_zcr(const float *x, unsigned int N, float fm) {
    float zcr=0.0;
    float res=0.0;
    int i;

    for(i=0;i<N;i++){
        if (x[i]*x[i-1]<0.0){
            res ++;
        } 
    }

    zcr = (fm/2.0)*(1.0/(N-1.0))*res;
    return zcr;
}

float hamming(const float *x, unsigned int N){

    float denominador=0.0;
    float numerador=0.0;
    int i;

    for (i=0;i<N;i++){
        numerador = numerador + pow((0.54 - 0.46*cos(2*PI*(i/N)))*x[i],2);        
        denominador = denominador + pow((0.54 - 0.46*cos(2*PI*(i/N))),2);
        //printf("num: %f\tden: %f\tdiv: %f\tlog: %f\n", numerador, denominador, numerador/denominador, 10*log10(numerador/denominador));
        //printf("%f\n",10*log10(numerador/denominador));
        //printf("i: %d\n",i);
        
    }


    return 10*log10(numerador/denominador);

}