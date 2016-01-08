module gsl.complex;
/* 
 * Copyright (C) 1996, 1997, 1998, 1999, 2000, 2007 Gerard Jungman, Brian Gough
 * 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or (at
 * your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
 */

/*
* D interface file for gsl_complex.h and gsl_complex_math.h
* Author: Chibisi Chima-Okereke
*/

extern (C){

/* two consecutive built-in types as a complex number */
alias gsl_complex_packed = double*;
alias gsl_complex_packed_float = float*;
alias gsl_complex_packed_long_double = real*;

alias gsl_const_complex_packed = const(double)*;
alias gsl_const_complex_packed_float = const(float)*;
alias gsl_const_complex_packed_long_double = const(real)*;


/* 2N consecutive built-in types as N complex numbers */
alias gsl_complex_packed_array = double*;
alias gsl_complex_packed_array_float = float*;
alias gsl_complex_packed_array_long_double = real*;

alias gsl_const_complex_packed_array = const(double)*;
alias gsl_const_complex_packed_array_float = const(float)*;
alias gsl_const_complex_packed_array_long_double = const(real)*;


/* Yes... this seems weird. Trust us. The point is just that
   sometimes you want to make it obvious that something is
   an output value. The fact that it lacks a 'const' may not
   be enough of a clue for people in some contexts.
 */
alias gsl_complex_packed_ptr = double*;
alias gsl_complex_packed_float_ptr = float*;
alias gsl_complex_packed_long_double_ptr = real*;

alias gsl_const_complex_packed_ptr = const(double)*;
alias gsl_const_complex_packed_float_ptr = const(float)*;
alias gsl_const_complex_packed_long_double_ptr = const(real)*;


struct gsl_complex_long_double
{
    real dat[2];
}

struct gsl_complex
{
    double dat[2];
}

struct gsl_complex_float
{
    float dat[2];
}

/************************************  gsl_complex_math.h ****************************************/

gsl_complex gsl_complex_polar(double r, double theta); /* r= r e^(i theta) */

gsl_complex gsl_complex_rect(double x, double y);  /* r= real+i*imag */

double gsl_complex_arg (gsl_complex z); /* return arg(z), -pi< arg(z) <=+pi */
double gsl_complex_abs (gsl_complex z);   /* return |z|   */
double gsl_complex_abs2 (gsl_complex z);  /* return |z|^2 */
double gsl_complex_logabs (gsl_complex z); /* return log|z| */

/* Complex arithmetic operators */

gsl_complex gsl_complex_add (gsl_complex a, gsl_complex b);  /* r=a+b */
gsl_complex gsl_complex_sub (gsl_complex a, gsl_complex b);  /* r=a-b */
gsl_complex gsl_complex_mul (gsl_complex a, gsl_complex b);  /* r=a*b */
gsl_complex gsl_complex_div (gsl_complex a, gsl_complex b);  /* r=a/b */
                                                           
gsl_complex gsl_complex_add_real (gsl_complex a, double x);  /* r=a+x */
gsl_complex gsl_complex_sub_real (gsl_complex a, double x);  /* r=a-x */
gsl_complex gsl_complex_mul_real (gsl_complex a, double x);  /* r=a*x */
gsl_complex gsl_complex_div_real (gsl_complex a, double x);  /* r=a/x */

gsl_complex gsl_complex_add_imag (gsl_complex a, double y);  /* r=a+iy */
gsl_complex gsl_complex_sub_imag (gsl_complex a, double y);  /* r=a-iy */
gsl_complex gsl_complex_mul_imag (gsl_complex a, double y);  /* r=a*iy */
gsl_complex gsl_complex_div_imag (gsl_complex a, double y);  /* r=a/iy */

gsl_complex gsl_complex_conjugate (gsl_complex z);  /* r=conj(z) */
gsl_complex gsl_complex_inverse (gsl_complex a);    /* r=1/a */
gsl_complex gsl_complex_negative (gsl_complex a);    /* r=-a */

/* Elementary Complex Functions */

gsl_complex gsl_complex_sqrt (gsl_complex z);  /* r=sqrt(z) */
gsl_complex gsl_complex_sqrt_real (double x);  /* r=sqrt(x) (x<0 ok) */

gsl_complex gsl_complex_pow (gsl_complex a, gsl_complex b);  /* r=a^b */
gsl_complex gsl_complex_pow_real (gsl_complex a, double b);  /* r=a^b */

gsl_complex gsl_complex_exp (gsl_complex a);    /* r=exp(a) */
gsl_complex gsl_complex_log (gsl_complex a);    /* r=log(a) (base e) */
gsl_complex gsl_complex_log10 (gsl_complex a);  /* r=log10(a) (base 10) */
gsl_complex gsl_complex_log_b (gsl_complex a, gsl_complex b);   /* r=log_b(a) (base=b) */

/* Complex Trigonometric Functions */

gsl_complex gsl_complex_sin (gsl_complex a);  /* r=sin(a) */
gsl_complex gsl_complex_cos (gsl_complex a);  /* r=cos(a) */
gsl_complex gsl_complex_sec (gsl_complex a);  /* r=sec(a) */
gsl_complex gsl_complex_csc (gsl_complex a);  /* r=csc(a) */
gsl_complex gsl_complex_tan (gsl_complex a);  /* r=tan(a) */
gsl_complex gsl_complex_cot (gsl_complex a);  /* r=cot(a) */

/* Inverse Complex Trigonometric Functions */

gsl_complex gsl_complex_arcsin (gsl_complex a);  /* r=arcsin(a) */
gsl_complex gsl_complex_arcsin_real (double a);  /* r=arcsin(a) */
gsl_complex gsl_complex_arccos (gsl_complex a);  /* r=arccos(a) */
gsl_complex gsl_complex_arccos_real (double a);  /* r=arccos(a) */
gsl_complex gsl_complex_arcsec (gsl_complex a);  /* r=arcsec(a) */
gsl_complex gsl_complex_arcsec_real (double a);  /* r=arcsec(a) */
gsl_complex gsl_complex_arccsc (gsl_complex a);  /* r=arccsc(a) */
gsl_complex gsl_complex_arccsc_real (double a);  /* r=arccsc(a) */
gsl_complex gsl_complex_arctan (gsl_complex a);  /* r=arctan(a) */
gsl_complex gsl_complex_arccot (gsl_complex a);  /* r=arccot(a) */

/* Complex Hyperbolic Functions */

gsl_complex gsl_complex_sinh (gsl_complex a);  /* r=sinh(a) */
gsl_complex gsl_complex_cosh (gsl_complex a);  /* r=coshh(a) */
gsl_complex gsl_complex_sech (gsl_complex a);  /* r=sech(a) */
gsl_complex gsl_complex_csch (gsl_complex a);  /* r=csch(a) */
gsl_complex gsl_complex_tanh (gsl_complex a);  /* r=tanh(a) */
gsl_complex gsl_complex_coth (gsl_complex a);  /* r=coth(a) */

/* Inverse Complex Hyperbolic Functions */

gsl_complex gsl_complex_arcsinh (gsl_complex a);  /* r=arcsinh(a) */
gsl_complex gsl_complex_arccosh (gsl_complex a);  /* r=arccosh(a) */
gsl_complex gsl_complex_arccosh_real (double a);  /* r=arccosh(a) */
gsl_complex gsl_complex_arcsech (gsl_complex a);  /* r=arcsech(a) */
gsl_complex gsl_complex_arccsch (gsl_complex a);  /* r=arccsch(a) */
gsl_complex gsl_complex_arctanh (gsl_complex a);  /* r=arctanh(a) */
gsl_complex gsl_complex_arctanh_real (double a);  /* r=arctanh(a) */
gsl_complex gsl_complex_arccoth (gsl_complex a);  /* r=arccoth(a) */


}

