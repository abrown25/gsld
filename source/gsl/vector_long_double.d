module gsl.vector_long_double;
/* vector/gsl_vector_long_double.h
 * 
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

import gsl.errno;
import gsl.check_range;
import gsl.block_long_double;
import core.stdc.stdio: FILE;

extern (C){

struct gsl_vector_long_double
{
  size_t size;
  size_t stride;
  real* data;
  gsl_block_long_double* block;
  int owner;
}

struct _gsl_vector_long_double_view
{
  gsl_vector_long_double vector;
}

alias gsl_vector_long_double_view = _gsl_vector_long_double_view;

struct _gsl_vector_long_double_const_view
{
  gsl_vector_long_double vector;
}

alias gsl_vector_long_double_const_view = const _gsl_vector_long_double_const_view;


/* Allocation */

gsl_vector_long_double* gsl_vector_long_double_alloc (const(size_t) n);
gsl_vector_long_double* gsl_vector_long_double_calloc (const(size_t) n);

gsl_vector_long_double* gsl_vector_long_double_alloc_from_block (gsl_block_long_double* b,
                                                     const size_t offset, 
                                                     const(size_t) n, 
                                                     const(size_t) stride);

gsl_vector_long_double* gsl_vector_long_double_alloc_from_vector (gsl_vector_long_double* v,
                                                      const size_t offset, 
                                                      const(size_t) n, 
                                                      const(size_t) stride);

void gsl_vector_long_double_free (gsl_vector_long_double* v);

/* Views */

_gsl_vector_long_double_view gsl_vector_long_double_view_array (real* v, size_t n);
_gsl_vector_long_double_view gsl_vector_long_double_view_array_with_stride (real* base, size_t stride, size_t n);
_gsl_vector_long_double_const_view gsl_vector_long_double_const_view_array (const(real)* v, size_t n);
_gsl_vector_long_double_const_view gsl_vector_long_double_const_view_array_with_stride (const(real)* base, size_t stride, size_t n);

_gsl_vector_long_double_view gsl_vector_long_double_subvector (gsl_vector_long_double* v, size_t i, size_t n);
_gsl_vector_long_double_view gsl_vector_long_double_subvector_with_stride (gsl_vector_long_double* v, size_t i, size_t stride, size_t n);
_gsl_vector_long_double_const_view gsl_vector_long_double_const_subvector (const(gsl_vector_long_double)* v, size_t i, size_t n);
_gsl_vector_long_double_const_view gsl_vector_long_double_const_subvector_with_stride (const(gsl_vector_long_double)* v, size_t i, size_t stride, size_t n);

/* Operations */

void gsl_vector_long_double_set_zero (gsl_vector_long_double* v);
void gsl_vector_long_double_set_all (gsl_vector_long_double* v, real x);
int gsl_vector_long_double_set_basis (gsl_vector_long_double* v, size_t i);

int gsl_vector_long_double_fread (FILE* stream, gsl_vector_long_double* v);
int gsl_vector_long_double_fwrite (FILE* stream, const(gsl_vector_long_double)* v);
int gsl_vector_long_double_fscanf (FILE* stream, gsl_vector_long_double* v);
int gsl_vector_long_double_fprintf (FILE* stream, const(gsl_vector_long_double)* v, const(char)* format);

int gsl_vector_long_double_memcpy (gsl_vector_long_double * dest, const gsl_vector_long_double * src);

int gsl_vector_long_double_reverse (gsl_vector_long_double* v);

int gsl_vector_long_double_swap (gsl_vector_long_double* v, gsl_vector_long_double * w);
int gsl_vector_long_double_swap_elements (gsl_vector_long_double* v, const(size_t) i, const(size_t) j);

real gsl_vector_long_double_max (const(gsl_vector_long_double)* v);
real gsl_vector_long_double_min (const(gsl_vector_long_double)* v);
void gsl_vector_long_double_minmax (const(gsl_vector_long_double)* v, real* min_out, real* max_out);

size_t gsl_vector_long_double_max_index (const(gsl_vector_long_double)* v);
size_t gsl_vector_long_double_min_index (const(gsl_vector_long_double)* v);
void gsl_vector_long_double_minmax_index (const(gsl_vector_long_double)* v, size_t * imin, size_t * imax);

int gsl_vector_long_double_add (gsl_vector_long_double* a, const(gsl_vector_long_double)* b);
int gsl_vector_long_double_sub (gsl_vector_long_double* a, const(gsl_vector_long_double)* b);
int gsl_vector_long_double_mul (gsl_vector_long_double* a, const(gsl_vector_long_double)* b);
int gsl_vector_long_double_div (gsl_vector_long_double* a, const(gsl_vector_long_double)* b);
int gsl_vector_long_double_scale (gsl_vector_long_double* a, const(double) x);
int gsl_vector_long_double_add_constant (gsl_vector_long_double* a, const(double) x);

int gsl_vector_long_double_equal (const(gsl_vector_long_double)* u, const(gsl_vector_long_double)* v);

int gsl_vector_long_double_isnull (const(gsl_vector_long_double)* v);
int gsl_vector_long_double_ispos (const(gsl_vector_long_double)* v);
int gsl_vector_long_double_isneg (const(gsl_vector_long_double)* v);
int gsl_vector_long_double_isnonneg (const(gsl_vector_long_double)* v);

real gsl_vector_long_double_get (const(gsl_vector_long_double)* v, const(size_t) i);
void gsl_vector_long_double_set (gsl_vector_long_double* v, const(size_t) i, real x);
real* gsl_vector_long_double_ptr (gsl_vector_long_double* v, const(size_t) i);
const(real)* gsl_vector_long_double_const_ptr (const(gsl_vector_long_double)* v, const(size_t) i);

}

