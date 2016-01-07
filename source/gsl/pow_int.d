module gsl.pow_int;
/* 
 * Copyright (C) 1996, 1997, 1998, 1999, 2000, 2004, 2007 Gerard Jungman, Brian Gough
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

double gsl_pow_2(const(double) x);
double gsl_pow_3(const(double) x);
double gsl_pow_4(const(double) x);
double gsl_pow_5(const(double) x);
double gsl_pow_6(const(double) x);
double gsl_pow_7(const(double) x);
double gsl_pow_8(const(double) x);
double gsl_pow_9(const(double) x);

double gsl_pow_2(const(double) x) { return x*x;   }
double gsl_pow_3(const(double) x) { return x*x*x; }
double gsl_pow_4(const(double) x) { double x2 = x*x;   return x2*x2;    }
double gsl_pow_5(const(double) x) { double x2 = x*x;   return x2*x2*x;  }
double gsl_pow_6(const(double) x) { double x2 = x*x;   return x2*x2*x2; }
double gsl_pow_7(const(double) x) { double x3 = x*x*x; return x3*x3*x;  }
double gsl_pow_8(const(double) x) { double x2 = x*x;   double x4 = x2*x2; return x4*x4; }
double gsl_pow_9(const(double) x) { double x3 = x*x*x; return x3*x3*x3; }

double gsl_pow_int(double x, int n);
double gsl_pow_uint(double x, uint n);
}

