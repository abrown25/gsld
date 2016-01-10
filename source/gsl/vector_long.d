module gsl.vector_long;
/* vector/gsl_vector_long.h
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
import gsl.block_long;
import core.stdc.stdio: FILE;


extern (C){

struct gsl_vector_long
{
  size_t size;
  size_t stride;
  long* data;
  gsl_block_long* block;
  int owner;
}

struct _gsl_vector_long_view
{
  gsl_vector_long vector;
}

alias gsl_vector_long_view = _gsl_vector_long_view;

struct _gsl_vector_long_const_view
{
  gsl_vector_long vector;
}

alias gsl_vector_long_const_view = const _gsl_vector_long_const_view;

/* Allocation */

gsl_vector_long *gsl_vector_long_alloc (const(size_t) n);
gsl_vector_long *gsl_vector_long_calloc (const(size_t) n);

gsl_vector_long *gsl_vector_long_alloc_from_block (gsl_block_long* b,
                                                     const(size_t) offset, 
                                                     const(size_t) n, 
                                                     const(size_t) stride);

gsl_vector_long *gsl_vector_long_alloc_from_vector (gsl_vector_long* v,
                                                      const(size_t) offset, 
                                                      const(size_t) n, 
                                                      const(size_t) stride);

void gsl_vector_long_free (gsl_vector_long* v);

/* Views */

_gsl_vector_long_view gsl_vector_long_view_array (long* v, size_t n);
_gsl_vector_long_view gsl_vector_long_view_array_with_stride (long* base, size_t stride, size_t n);
_gsl_vector_long_const_view gsl_vector_long_const_view_array (const(long)* v, size_t n);
_gsl_vector_long_const_view gsl_vector_long_const_view_array_with_stride (const(long)* base, size_t stride, size_t n);

_gsl_vector_long_view gsl_vector_long_subvector (gsl_vector_long* v, size_t i, size_t n);
_gsl_vector_long_view gsl_vector_long_subvector_with_stride (gsl_vector_long* v, size_t i, size_t stride, size_t n);
_gsl_vector_long_const_view gsl_vector_long_const_subvector (const(gsl_vector_long)* v, size_t i, size_t n);

_gsl_vector_long_const_view gsl_vector_long_const_subvector_with_stride (const(gsl_vector_long)* v, size_t i, size_t stride, size_t n);

/* Operations */

void gsl_vector_long_set_zero (gsl_vector_long* v);
void gsl_vector_long_set_all (gsl_vector_long* v, long x);
int gsl_vector_long_set_basis (gsl_vector_long* v, size_t i);

int gsl_vector_long_fread (FILE* stream, gsl_vector_long* v);
int gsl_vector_long_fwrite (FILE* stream, const(gsl_vector_long)* v);
int gsl_vector_long_fscanf (FILE* stream, gsl_vector_long* v);
int gsl_vector_long_fprintf (FILE* stream, const(gsl_vector_long)* v, const(char)* format);

int gsl_vector_long_memcpy (gsl_vector_long* dest, const(gsl_vector_long)* src);

int gsl_vector_long_reverse (gsl_vector_long* v);

int gsl_vector_long_swap (gsl_vector_long* v, gsl_vector_long* w);
int gsl_vector_long_swap_elements (gsl_vector_long* v, const(size_t) i, const(size_t) j);

long gsl_vector_long_max (const(gsl_vector_long)* v);
long gsl_vector_long_min (const(gsl_vector_long)* v);
void gsl_vector_long_minmax (const(gsl_vector_long)* v, long* min_out, long* max_out);

size_t gsl_vector_long_max_index (const(gsl_vector_long)* v);
size_t gsl_vector_long_min_index (const(gsl_vector_long)* v);
void gsl_vector_long_minmax_index (const(gsl_vector_long)* v, size_t* imin, size_t* imax);

int gsl_vector_long_add (gsl_vector_long* a, const(gsl_vector_long)* b);
int gsl_vector_long_sub (gsl_vector_long* a, const(gsl_vector_long)* b);
int gsl_vector_long_mul (gsl_vector_long* a, const(gsl_vector_long)* b);
int gsl_vector_long_div (gsl_vector_long* a, const(gsl_vector_long)* b);
int gsl_vector_long_scale (gsl_vector_long* a, const(double) x);
int gsl_vector_long_add_constant (gsl_vector_long* a, const(double) x);

int gsl_vector_long_equal (const gsl_vector_long* u, 
                            const(gsl_vector_long)* v);

int gsl_vector_long_isnull (const(gsl_vector_long)* v);
int gsl_vector_long_ispos (const(gsl_vector_long)* v);
int gsl_vector_long_isneg (const(gsl_vector_long)* v);
int gsl_vector_long_isnonneg (const(gsl_vector_long)* v);

long gsl_vector_long_get (const(gsl_vector_long)* v, const(size_t) i);
void gsl_vector_long_set (gsl_vector_long* v, const(size_t) i, long x);
long* gsl_vector_long_ptr (gsl_vector_long* v, const(size_t) i);
const(long)* gsl_vector_long_const_ptr (const(gsl_vector_long)* v, const(size_t) i);

}

