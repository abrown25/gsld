module gsl.matrix_uint;
/* matrix/gsl_matrix_uint.h
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
import gsl.block_uint;
import gsl.check_range;
import gsl.vector_uint;
import core.stdc.stdio: FILE;

extern (C){

struct gsl_matrix_uint
{
  size_t size1;
  size_t size2;
  size_t tda;
  uint* data;
  gsl_block_uint* block;
  int owner;
}

struct _gsl_matrix_uint_view
{
  gsl_matrix_uint matrix;
}

alias gsl_matrix_uint_view = _gsl_matrix_uint_view;

struct _gsl_matrix_uint_const_view
{
  gsl_matrix_uint matrix;
}

alias gsl_matrix_uint_const_view = const(_gsl_matrix_uint_const_view);

/* Allocation */

gsl_matrix_uint* 
gsl_matrix_uint_alloc (const(size_t) n1, const(size_t) n2);

gsl_matrix_uint* 
gsl_matrix_uint_calloc (const(size_t) n1, const(size_t) n2);

gsl_matrix_uint* 
gsl_matrix_uint_alloc_from_block (gsl_block_uint* b, 
                                   const(size_t) offset, 
                                   const(size_t) n1, 
                                   const(size_t) n2, 
                                   const(size_t) d2);

gsl_matrix_uint* 
gsl_matrix_uint_alloc_from_matrix (gsl_matrix_uint* m,
                                    const(size_t) k1, 
                                    const(size_t) k2,
                                    const(size_t) n1, 
                                    const(size_t) n2);

gsl_vector_uint* 
gsl_vector_uint_alloc_row_from_matrix (gsl_matrix_uint* m,
                                        const(size_t) i);

gsl_vector_uint* 
gsl_vector_uint_alloc_col_from_matrix (gsl_matrix_uint* m,
                                        const(size_t) j);

void gsl_matrix_uint_free (gsl_matrix_uint* m);

/* Views */

_gsl_matrix_uint_view 
gsl_matrix_uint_submatrix (gsl_matrix_uint* m, 
                            const(size_t) i, const(size_t) j, 
                            const(size_t) n1, const(size_t) n2);

_gsl_vector_uint_view 
gsl_matrix_uint_row (gsl_matrix_uint* m, const(size_t) i);

_gsl_vector_uint_view 
gsl_matrix_uint_column (gsl_matrix_uint* m, const(size_t) j);

_gsl_vector_uint_view 
gsl_matrix_uint_diagonal (gsl_matrix_uint* m);

_gsl_vector_uint_view 
gsl_matrix_uint_subdiagonal (gsl_matrix_uint* m, const(size_t) k);

_gsl_vector_uint_view 
gsl_matrix_uint_superdiagonal (gsl_matrix_uint* m, const(size_t) k);

_gsl_vector_uint_view
gsl_matrix_uint_subrow (gsl_matrix_uint* m, const(size_t) i,
                         const(size_t) offset, const(size_t) n);

_gsl_vector_uint_view
gsl_matrix_uint_subcolumn (gsl_matrix_uint* m, const(size_t) j,
                            const(size_t) offset, const(size_t) n);

_gsl_matrix_uint_view
gsl_matrix_uint_view_array (uint* base,
                             const(size_t) n1, 
                             const(size_t) n2);

_gsl_matrix_uint_view
gsl_matrix_uint_view_array_with_tda (uint* base, 
                                      const(size_t) n1, 
                                      const(size_t) n2,
                                      const(size_t) tda);


_gsl_matrix_uint_view
gsl_matrix_uint_view_vector (gsl_vector_uint* v,
                              const(size_t) n1, 
                              const(size_t) n2);

_gsl_matrix_uint_view
gsl_matrix_uint_view_vector_with_tda (gsl_vector_uint* v,
                                       const(size_t) n1, 
                                       const(size_t) n2,
                                       const(size_t) tda);


_gsl_matrix_uint_const_view 
gsl_matrix_uint_const_submatrix (const(gsl_matrix_uint)* m, 
                                  const(size_t) i, const(size_t) j, 
                                  const(size_t) n1, const(size_t) n2);

_gsl_vector_uint_const_view 
gsl_matrix_uint_const_row (const(gsl_matrix_uint)* m, 
                            const(size_t) i);

_gsl_vector_uint_const_view 
gsl_matrix_uint_const_column (const(gsl_matrix_uint)* m, 
                               const(size_t) j);

_gsl_vector_uint_const_view
gsl_matrix_uint_const_diagonal (const(gsl_matrix_uint)* m);

_gsl_vector_uint_const_view 
gsl_matrix_uint_const_subdiagonal (const(gsl_matrix_uint)* m, 
                                    const(size_t) k);

_gsl_vector_uint_const_view 
gsl_matrix_uint_const_superdiagonal (const(gsl_matrix_uint)* m, 
                                      const(size_t) k);

_gsl_vector_uint_const_view
gsl_matrix_uint_const_subrow (const(gsl_matrix_uint)* m, const(size_t) i,
                               const(size_t) offset, const(size_t) n);

_gsl_vector_uint_const_view
gsl_matrix_uint_const_subcolumn (const(gsl_matrix_uint)* m, const(size_t) j,
                                  const(size_t) offset, const(size_t) n);

_gsl_matrix_uint_const_view
gsl_matrix_uint_const_view_array (const(uint)* base,
                                   const(size_t) n1, 
                                   const(size_t) n2);

_gsl_matrix_uint_const_view
gsl_matrix_uint_const_view_array_with_tda (const(uint)* base, 
                                            const(size_t) n1, 
                                            const(size_t) n2,
                                            const(size_t) tda);

_gsl_matrix_uint_const_view
gsl_matrix_uint_const_view_vector (const(gsl_vector_uint)* v,
                                    const(size_t) n1, 
                                    const(size_t) n2);

_gsl_matrix_uint_const_view
gsl_matrix_uint_const_view_vector_with_tda (const(gsl_vector_uint)* v,
                                             const(size_t) n1, 
                                             const(size_t) n2,
                                             const(size_t) tda);

/* Operations */

void gsl_matrix_uint_set_zero (gsl_matrix_uint* m);
void gsl_matrix_uint_set_identity (gsl_matrix_uint* m);
void gsl_matrix_uint_set_all (gsl_matrix_uint* m, uint x);

int gsl_matrix_uint_fread (FILE* stream, gsl_matrix_uint* m) ;
int gsl_matrix_uint_fwrite (FILE* stream, const(gsl_matrix_uint)* m) ;
int gsl_matrix_uint_fscanf (FILE* stream, gsl_matrix_uint* m);
int gsl_matrix_uint_fprintf (FILE* stream, const(gsl_matrix_uint)* m, const(char)* format);
 
int gsl_matrix_uint_memcpy(gsl_matrix_uint* dest, const(gsl_matrix_uint)* src);
int gsl_matrix_uint_swap(gsl_matrix_uint* m1, gsl_matrix_uint* m2);

int gsl_matrix_uint_swap_rows(gsl_matrix_uint* m, const(size_t) i, const(size_t) j);
int gsl_matrix_uint_swap_columns(gsl_matrix_uint* m, const(size_t) i, const(size_t) j);
int gsl_matrix_uint_swap_rowcol(gsl_matrix_uint* m, const(size_t) i, const(size_t) j);
int gsl_matrix_uint_transpose (gsl_matrix_uint* m);
int gsl_matrix_uint_transpose_memcpy (gsl_matrix_uint* dest, const(gsl_matrix_uint)* src);

uint gsl_matrix_uint_max (const(gsl_matrix_uint)* m);
uint gsl_matrix_uint_min (const(gsl_matrix_uint)* m);
void gsl_matrix_uint_minmax (const(gsl_matrix_uint)* m, uint* min_out, uint* max_out);

void gsl_matrix_uint_max_index (const(gsl_matrix_uint)* m, size_t* imax, size_t* jmax);
void gsl_matrix_uint_min_index (const(gsl_matrix_uint)* m, size_t* imin, size_t* jmin);
void gsl_matrix_uint_minmax_index (const(gsl_matrix_uint)* m, size_t* imin, size_t* jmin, size_t* imax, size_t* jmax);

int gsl_matrix_uint_equal (const(gsl_matrix_uint)* a, const(gsl_matrix_uint)* b);

int gsl_matrix_uint_isnull (const(gsl_matrix_uint)* m);
int gsl_matrix_uint_ispos (const(gsl_matrix_uint)* m);
int gsl_matrix_uint_isneg (const(gsl_matrix_uint)* m);
int gsl_matrix_uint_isnonneg (const(gsl_matrix_uint)* m);

int gsl_matrix_uint_add (gsl_matrix_uint* a, const(gsl_matrix_uint)* b);
int gsl_matrix_uint_sub (gsl_matrix_uint* a, const(gsl_matrix_uint)* b);
int gsl_matrix_uint_mul_elements (gsl_matrix_uint* a, const(gsl_matrix_uint)* b);
int gsl_matrix_uint_div_elements (gsl_matrix_uint* a, const(gsl_matrix_uint)* b);
int gsl_matrix_uint_scale (gsl_matrix_uint* a, const(double) x);
int gsl_matrix_uint_add_constant (gsl_matrix_uint* a, const(double) x);
int gsl_matrix_uint_add_diagonal (gsl_matrix_uint* a, const(double) x);

/***********************************************************************/
/* The functions below are obsolete                                    */
/***********************************************************************/
int gsl_matrix_uint_get_row(gsl_vector_uint* v, const(gsl_matrix_uint)* m, const(size_t) i);
int gsl_matrix_uint_get_col(gsl_vector_uint* v, const(gsl_matrix_uint)* m, const(size_t) j);
int gsl_matrix_uint_set_row(gsl_matrix_uint* m, const(size_t) i, const(gsl_vector_uint)* v);
int gsl_matrix_uint_set_col(gsl_matrix_uint* m, const(size_t) j, const(gsl_vector_uint)* v);
/***********************************************************************/

/* inline functions if you are using GCC */

uint   gsl_matrix_uint_get(const(gsl_matrix_uint)* m, const(size_t) i, const(size_t) j);
void    gsl_matrix_uint_set(gsl_matrix_uint* m, const(size_t) i, const(size_t) j, const(uint) x);
uint* gsl_matrix_uint_ptr(gsl_matrix_uint* m, const(size_t) i, const(size_t) j);
const(uint)* gsl_matrix_uint_const_ptr(const(gsl_matrix_uint)* m, const(size_t) i, const(size_t) j);

}

