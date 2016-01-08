module gsl.min;
/* min/gsl_min.h
 * 
 * Copyright (C) 1996, 1997, 1998, 1999, 2000, 2007, 2009 Brian Gough
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
* D interface file for file gsl_min.h
* Author: Chibisi Chima-Okereke
*/

import gsl.math;

extern (C){

struct gsl_min_fminimizer_type
{
  const(char)* name;
  size_t size;
  int function(void* state, gsl_function* f, double x_minimum, double f_minimum, double x_lower, double f_lower, double x_upper, double f_upper) set;
  int function(void* state, gsl_function* f, double* x_minimum, double* f_minimum, double* x_lower, double* f_lower, double* x_upper, double* f_upper) iterate;
}

struct gsl_min_fminimizer
{
  const(gsl_min_fminimizer_type)* type;
  gsl_function* function_ ;
  double x_minimum ;
  double x_lower ;
  double x_upper ;
  double f_minimum, f_lower, f_upper;
  void* state;
}

gsl_min_fminimizer* gsl_min_fminimizer_alloc (const(gsl_min_fminimizer_type)* T) ;
                                      
void gsl_min_fminimizer_free (gsl_min_fminimizer* s);

int gsl_min_fminimizer_set (gsl_min_fminimizer* s, 
                            gsl_function* f, double x_minimum, 
                            double x_lower, double x_upper);

int gsl_min_fminimizer_set_with_values (gsl_min_fminimizer* s, 
                                        gsl_function* f, 
                                        double x_minimum, double f_minimum,
                                        double x_lower, double f_lower,
                                        double x_upper, double f_upper);

int gsl_min_fminimizer_iterate (gsl_min_fminimizer* s);

const(char)* gsl_min_fminimizer_name (const(gsl_min_fminimizer)* s);

double gsl_min_fminimizer_x_minimum (const(gsl_min_fminimizer)* s);
double gsl_min_fminimizer_x_lower (const(gsl_min_fminimizer)* s);
double gsl_min_fminimizer_x_upper (const(gsl_min_fminimizer)* s);
double gsl_min_fminimizer_f_minimum (const(gsl_min_fminimizer)* s);
double gsl_min_fminimizer_f_lower (const(gsl_min_fminimizer)* s);
double gsl_min_fminimizer_f_upper (const(gsl_min_fminimizer)* s);

/* Deprecated, use x_minimum instead */
double gsl_min_fminimizer_minimum (const(gsl_min_fminimizer)* s);

int gsl_min_test_interval (double x_lower, double x_upper, double epsabs, double epsrel);

extern const gsl_min_fminimizer_type* gsl_min_fminimizer_goldensection;
extern const gsl_min_fminimizer_type* gsl_min_fminimizer_brent;
extern const gsl_min_fminimizer_type* gsl_min_fminimizer_quad_golden;

alias gsl_min_bracketing_function = int function(gsl_function* f, double* x_minimum,double* f_minimum, double* x_lower, double* f_lower, double* x_upper, double* f_upper, size_t eval_max);
int gsl_min_find_bracket(gsl_function* f,double* x_minimum, double* f_minimum, double*x_lower, double* f_lower, double* x_upper, double* f_upper, size_t eval_max);

}

