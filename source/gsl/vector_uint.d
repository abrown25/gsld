module gsl.vector_uint;
/* vector/gsl_vector_uint.h
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
import gsl.block_uint;
import core.stdc.stdio: FILE;

extern (C){

struct gsl_vector_uint
{
  size_t size;
  size_t stride;
  uint* data;
  gsl_block_uint* block;
  int owner;
}

struct _gsl_vector_uint_view
{
  gsl_vector_uint vector;
}

alias gsl_vector_uint_view = _gsl_vector_uint_view;

struct _gsl_vector_uint_const_view
{
  gsl_vector_uint vector;
}

alias gsl_vector_uint_const_view = const _gsl_vector_uint_const_view;


/* Allocation */

gsl_vector_uint* gsl_vector_uint_alloc (const(size_t) n);
gsl_vector_uint* gsl_vector_uint_calloc (const(size_t) n);
gsl_vector_uint* gsl_vector_uint_alloc_from_block (gsl_block_uint* b, const(size_t) offset, const(size_t) n, const(size_t) stride);
gsl_vector_uint* gsl_vector_uint_alloc_from_vector (gsl_vector_uint* v, const(size_t) offset, const(size_t) n, const(size_t) stride);
void gsl_vector_uint_free (gsl_vector_uint* v);

/* Views */

_gsl_vector_uint_view gsl_vector_uint_view_array (uint* v, size_t n);
_gsl_vector_uint_view gsl_vector_uint_view_array_with_stride (uint *base, size_t stride, size_t n);
_gsl_vector_uint_const_view gsl_vector_uint_const_view_array (const(uint)* v, size_t n);
_gsl_vector_uint_const_view gsl_vector_uint_const_view_array_with_stride (const(uint)* base, size_t stride, size_t n);
_gsl_vector_uint_view gsl_vector_uint_subvector (gsl_vector_uint* v, size_t i, size_t n);
_gsl_vector_uint_view gsl_vector_uint_subvector_with_stride (gsl_vector_uint* v, size_t i, size_t stride, size_t n);
_gsl_vector_uint_const_view gsl_vector_uint_const_subvector (const(gsl_vector_uint)* v, size_t i, size_t n);
_gsl_vector_uint_const_view gsl_vector_uint_const_subvector_with_stride (const(gsl_vector_uint)* v, size_t i, size_t stride, size_t n);

/* Operations */

void gsl_vector_uint_set_zero (gsl_vector_uint* v);
void gsl_vector_uint_set_all (gsl_vector_uint* v, uint x);
int gsl_vector_uint_set_basis (gsl_vector_uint* v, size_t i);

int gsl_vector_uint_fread (FILE* stream, gsl_vector_uint* v);
int gsl_vector_uint_fwrite (FILE* stream, const(gsl_vector_uint)* v);
int gsl_vector_uint_fscanf (FILE* stream, gsl_vector_uint* v);
int gsl_vector_uint_fprintf (FILE* stream, const(gsl_vector_uint)* v, const(char)* format);

int gsl_vector_uint_memcpy (gsl_vector_uint* dest, const(gsl_vector_uint)* src);
int gsl_vector_uint_reverse (gsl_vector_uint* v);
int gsl_vector_uint_swap (gsl_vector_uint* v, gsl_vector_uint* w);
int gsl_vector_uint_swap_elements (gsl_vector_uint* v, const(size_t) i, const(size_t) j);

uint gsl_vector_uint_max (const(gsl_vector_uint)* v);
uint gsl_vector_uint_min (const(gsl_vector_uint)* v);
void gsl_vector_uint_minmax (const(gsl_vector_uint)* v, uint* min_out, uint* max_out);

size_t gsl_vector_uint_max_index (const(gsl_vector_uint)* v);
size_t gsl_vector_uint_min_index (const(gsl_vector_uint)* v);
void gsl_vector_uint_minmax_index (const(gsl_vector_uint)* v, size_t* imin, size_t* imax);

int gsl_vector_uint_add (gsl_vector_uint* a, const(gsl_vector_uint)* b);
int gsl_vector_uint_sub (gsl_vector_uint* a, const(gsl_vector_uint)* b);
int gsl_vector_uint_mul (gsl_vector_uint* a, const(gsl_vector_uint)* b);
int gsl_vector_uint_div (gsl_vector_uint* a, const(gsl_vector_uint)* b);
int gsl_vector_uint_scale (gsl_vector_uint* a, const(double) x);
int gsl_vector_uint_add_constant (gsl_vector_uint* a, const(double) x);

int gsl_vector_uint_equal (const(gsl_vector_uint)* u, 
                            const(gsl_vector_uint)* v);

int gsl_vector_uint_isnull (const(gsl_vector_uint)* v);
int gsl_vector_uint_ispos (const(gsl_vector_uint)* v);
int gsl_vector_uint_isneg (const(gsl_vector_uint)* v);
int gsl_vector_uint_isnonneg (const(gsl_vector_uint)* v);

uint gsl_vector_uint_get (const(gsl_vector_uint)* v, const(size_t) i);
void gsl_vector_uint_set (gsl_vector_uint* v, const(size_t) i, uint x);
uint* gsl_vector_uint_ptr (gsl_vector_uint* v, const(size_t) i);
const(uint)*  gsl_vector_uint_const_ptr (const(gsl_vector_uint)* v, const(size_t) i);

}

