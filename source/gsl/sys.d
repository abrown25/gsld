module gsl.sys;
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
* D interface file:
* Author: Chibisi Chima-Okereke
*/

extern (C){

double gsl_log1p (const(double) x);
double gsl_expm1 (const(double) x);
double gsl_hypot (const(double) x, const(double) y);
double gsl_hypot3 (const(double) x, const(double) y, const(double) z);
double gsl_acosh (const(double) x);
double gsl_asinh (const(double) x);
double gsl_atanh (const(double) x);

int gsl_isnan (const(double) x);
int gsl_isinf (const(double) x);
int gsl_finite (const(double) x);

double gsl_nan ();
double gsl_posinf ();
double gsl_neginf ();
double gsl_fdiv (const(double) x, const(double) y);

double gsl_coerce_double (const(double) x);
float gsl_coerce_float (const float x);
real gsl_coerce_long_double (const(real) x);

double gsl_ldexp(const(double) x, const int e);
double gsl_frexp(const(double) x, int * e);

int gsl_fcmp (const(double) x1, const(double) x2, const(double) epsilon);

}

