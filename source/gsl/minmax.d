module gsl.minmax;
/* 
 * Copyright (C) 2008 Gerard Jungman, Brian Gough
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
* D interface file for gsl_minmax.h
* Author: Chibisi Chima-Okereke
*/

/* Define MAX and MIN macros/functions if they don't exist. */

extern (C){

T GSL_MAX(T)(T a, T b){
  return a > b ? a : b;
}

T GSL_MIN(T)(T a, T b){
  return a < b ? a : b;
}

/* function versions of the above, in case they are needed */
double gsl_max (double a, double b);
double gsl_min (double a, double b);

/* inline-friendly strongly typed versions */

int GSL_MAX_INT(int a, int b);
int GSL_MIN_INT(int a, int b);
double GSL_MAX_DBL(double a, double b);
double GSL_MIN_DBL(double a, double b);
real GSL_MAX_LDBL(real a, real b);
real GSL_MIN_LDBL(real a, real b);

/*
int GSL_MAX_INT (int a, int b)
{
  return GSL_MAX (a, b);
}

int GSL_MIN_INT (int a, int b)
{
  return GSL_MIN (a, b);
}

double GSL_MAX_DBL (double a, double b)
{
  return GSL_MAX (a, b);
}

double GSL_MIN_DBL (double a, double b)
{
  return GSL_MIN (a, b);
}

real GSL_MAX_LDBL (real a, real b)
{
  return GSL_MAX (a, b);
}

real GSL_MIN_LDBL (real a, real b)
{
  return GSL_MIN (a, b);
}
*/

}

