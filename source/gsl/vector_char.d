module gsl.vector_char;
/* vector/gsl_vector_char.h
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
import gsl.block_char;
import core.stdc.stdio: FILE;

extern (C){

struct gsl_vector_char
{
  size_t size;
  size_t stride;
  char* data;
  gsl_block_char* block;
  int owner;
}

struct _gsl_vector_char_view
{
  gsl_vector_char vector;
}

alias gsl_vector_char_view = _gsl_vector_char_view;

struct _gsl_vector_char_const_view
{
  gsl_vector_char vector;
}

alias gsl_vector_char_const_view = const(_gsl_vector_char_const_view);

/* Allocation */

gsl_vector_char* gsl_vector_char_alloc (const(size_t) n);
gsl_vector_char* gsl_vector_char_calloc (const(size_t) n);

gsl_vector_char* gsl_vector_char_alloc_from_block (gsl_block_char* b,
                                                     const(size_t) offset, 
                                                     const(size_t) n, 
                                                     const(size_t) stride);

gsl_vector_char* gsl_vector_char_alloc_from_vector (gsl_vector_char* v,
                                                      const(size_t) offset, 
                                                      const(size_t) n, 
                                                      const(size_t) stride);

void gsl_vector_char_free (gsl_vector_char* v);

/* Views */

_gsl_vector_char_view gsl_vector_char_view_array (char* v, size_t n);
_gsl_vector_char_view gsl_vector_char_view_array_with_stride (char* base, size_t stride, size_t n);
_gsl_vector_char_const_view gsl_vector_char_const_view_array (const(size_t) offset, size_t n);
_gsl_vector_char_const_view gsl_vector_char_const_view_array_with_stride (const(char)* base, size_t stride, size_t n);
_gsl_vector_char_view gsl_vector_char_subvector (gsl_vector_char* v, size_t i, size_t n);
_gsl_vector_char_view gsl_vector_char_subvector_with_stride (gsl_vector_char* v, size_t i, size_t stride, size_t n);
_gsl_vector_char_const_view gsl_vector_char_const_subvector (const(gsl_vector_char)* v, size_t i, size_t n);
_gsl_vector_char_const_view gsl_vector_char_const_subvector_with_stride (const(gsl_vector_char)* v, size_t i, size_t stride, size_t n);

/* Operations */

void gsl_vector_char_set_zero (gsl_vector_char* v);
void gsl_vector_char_set_all (gsl_vector_char* v, char x);
int gsl_vector_char_set_basis (gsl_vector_char* v, size_t i);

int gsl_vector_char_fread (FILE* stream, gsl_vector_char* v);
int gsl_vector_char_fwrite (FILE* stream, const(gsl_vector_char)* v);
int gsl_vector_char_fscanf (FILE* stream, gsl_vector_char* v);
int gsl_vector_char_fprintf (FILE* stream, const(gsl_vector_char)* v, const(char)* format);

int gsl_vector_char_memcpy (gsl_vector_char* dest, const(gsl_vector_char)* src);

int gsl_vector_char_reverse (gsl_vector_char* v);

int gsl_vector_char_swap (gsl_vector_char* v, gsl_vector_char* w);
int gsl_vector_char_swap_elements (gsl_vector_char* v, const(size_t) i, const(size_t) j);

char gsl_vector_char_max (const(gsl_vector_char)* v);
char gsl_vector_char_min (const(gsl_vector_char)* v);
void gsl_vector_char_minmax (const(gsl_vector_char)* v, char* min_out, char* max_out);

size_t gsl_vector_char_max_index (const(gsl_vector_char)* v);
size_t gsl_vector_char_min_index (const(gsl_vector_char)* v);
void gsl_vector_char_minmax_index (const(gsl_vector_char)* v, size_t* imin, size_t* imax);

int gsl_vector_char_add (gsl_vector_char* a, const(gsl_vector_char)* b);
int gsl_vector_char_sub (gsl_vector_char* a, const(gsl_vector_char)* b);
int gsl_vector_char_mul (gsl_vector_char* a, const(gsl_vector_char)* b);
int gsl_vector_char_div (gsl_vector_char* a, const(gsl_vector_char)* b);
int gsl_vector_char_scale (gsl_vector_char* a, const(double) x);
int gsl_vector_char_add_constant (gsl_vector_char* a, const(double) x);

int gsl_vector_char_equal (const(gsl_vector_char)* u, const(gsl_vector_char)* v);

int gsl_vector_char_isnull (const(gsl_vector_char)* v);
int gsl_vector_char_ispos (const(gsl_vector_char)* v);
int gsl_vector_char_isneg (const(gsl_vector_char)* v);
int gsl_vector_char_isnonneg (const(gsl_vector_char)* v);

char gsl_vector_char_get (const(gsl_vector_char)* v, const(size_t) i);
void gsl_vector_char_set (gsl_vector_char* v, const(size_t) i, char x);
char* gsl_vector_char_ptr (gsl_vector_char* v, const(size_t) i);
const(char)* gsl_vector_char_const_ptr (const(gsl_vector_char)* v, const(size_t) i);

}

