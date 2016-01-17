module gsl.matrix_short;
/* matrix/gsl_matrix_short.h
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
import gsl.block_short;
import gsl.check_range;
import gsl.vector_short;
import core.stdc.stdio: FILE;

extern (C){

struct gsl_matrix_short
{
  size_t size1;
  size_t size2;
  size_t tda;
  short* data;
  gsl_block_short* block;
  int owner;
}

struct _gsl_matrix_short_view
{
  gsl_matrix_short matrix;
}

alias gsl_matrix_short_view = _gsl_matrix_short_view;

struct _gsl_matrix_short_const_view
{
  gsl_matrix_short matrix;
}

alias gsl_matrix_short_const_view = const(_gsl_matrix_short_const_view);

/* Allocation */

gsl_matrix_short* 
gsl_matrix_short_alloc (const(size_t) n1, const(size_t) n2);

gsl_matrix_short* 
gsl_matrix_short_calloc (const(size_t) n1, const(size_t) n2);

gsl_matrix_short* 
gsl_matrix_short_alloc_from_block (gsl_block_short* b, 
                                   const(size_t) offset, 
                                   const(size_t) n1, 
                                   const(size_t) n2, 
                                   const(size_t) d2);

gsl_matrix_short* 
gsl_matrix_short_alloc_from_matrix (gsl_matrix_short* m,
                                    const(size_t) k1, 
                                    const(size_t) k2,
                                    const(size_t) n1, 
                                    const(size_t) n2);

gsl_vector_short* 
gsl_vector_short_alloc_row_from_matrix (gsl_matrix_short* m,
                                        const(size_t) i);

gsl_vector_short* 
gsl_vector_short_alloc_col_from_matrix (gsl_matrix_short* m,
                                        const(size_t) j);

void gsl_matrix_short_free (gsl_matrix_short* m);

/* Views */

_gsl_matrix_short_view 
gsl_matrix_short_submatrix (gsl_matrix_short* m, 
                            const(size_t) i, const(size_t) j, 
                            const(size_t) n1, const(size_t) n2);

_gsl_vector_short_view 
gsl_matrix_short_row (gsl_matrix_short* m, const(size_t) i);

_gsl_vector_short_view 
gsl_matrix_short_column (gsl_matrix_short* m, const(size_t) j);

_gsl_vector_short_view 
gsl_matrix_short_diagonal (gsl_matrix_short* m);

_gsl_vector_short_view 
gsl_matrix_short_subdiagonal (gsl_matrix_short* m, const(size_t) k);

_gsl_vector_short_view 
gsl_matrix_short_superdiagonal (gsl_matrix_short* m, const(size_t) k);

_gsl_vector_short_view
gsl_matrix_short_subrow (gsl_matrix_short* m, const(size_t) i,
                         const(size_t) offset, const(size_t) n);

_gsl_vector_short_view
gsl_matrix_short_subcolumn (gsl_matrix_short* m, const(size_t) j,
                            const(size_t) offset, const(size_t) n);

_gsl_matrix_short_view
gsl_matrix_short_view_array (short* base,
                             const(size_t) n1, 
                             const(size_t) n2);

_gsl_matrix_short_view
gsl_matrix_short_view_array_with_tda (short* base, 
                                      const(size_t) n1, 
                                      const(size_t) n2,
                                      const(size_t) tda);


_gsl_matrix_short_view
gsl_matrix_short_view_vector (gsl_vector_short* v,
                              const(size_t) n1, 
                              const(size_t) n2);

_gsl_matrix_short_view
gsl_matrix_short_view_vector_with_tda (gsl_vector_short* v,
                                       const(size_t) n1, 
                                       const(size_t) n2,
                                       const(size_t) tda);


_gsl_matrix_short_const_view 
gsl_matrix_short_const_submatrix (const(gsl_matrix_short)* m, 
                                  const(size_t) i, const(size_t) j, 
                                  const(size_t) n1, const(size_t) n2);

_gsl_vector_short_const_view 
gsl_matrix_short_const_row (const(gsl_matrix_short)* m, 
                            const(size_t) i);

_gsl_vector_short_const_view 
gsl_matrix_short_const_column (const(gsl_matrix_short)* m, 
                               const(size_t) j);

_gsl_vector_short_const_view
gsl_matrix_short_const_diagonal (const(gsl_matrix_short)* m);

_gsl_vector_short_const_view 
gsl_matrix_short_const_subdiagonal (const(gsl_matrix_short)* m, 
                                    const(size_t) k);

_gsl_vector_short_const_view 
gsl_matrix_short_const_superdiagonal (const(gsl_matrix_short)* m, 
                                      const(size_t) k);

_gsl_vector_short_const_view
gsl_matrix_short_const_subrow (const(gsl_matrix_short)* m, const(size_t) i,
                               const(size_t) offset, const(size_t) n);

_gsl_vector_short_const_view
gsl_matrix_short_const_subcolumn (const(gsl_matrix_short)* m, const(size_t) j,
                                  const(size_t) offset, const(size_t) n);

_gsl_matrix_short_const_view
gsl_matrix_short_const_view_array (const(short)* base,
                                   const(size_t) n1, 
                                   const(size_t) n2);

_gsl_matrix_short_const_view
gsl_matrix_short_const_view_array_with_tda (const(short)* base, 
                                            const(size_t) n1, 
                                            const(size_t) n2,
                                            const(size_t) tda);

_gsl_matrix_short_const_view
gsl_matrix_short_const_view_vector (const(gsl_vector_short)* v,
                                    const(size_t) n1, 
                                    const(size_t) n2);

_gsl_matrix_short_const_view
gsl_matrix_short_const_view_vector_with_tda (const(gsl_vector_short)* v,
                                             const(size_t) n1, 
                                             const(size_t) n2,
                                             const(size_t) tda);

/* Operations */

void gsl_matrix_short_set_zero (gsl_matrix_short* m);
void gsl_matrix_short_set_identity (gsl_matrix_short* m);
void gsl_matrix_short_set_all (gsl_matrix_short* m, short x);

int gsl_matrix_short_fread (FILE* stream, gsl_matrix_short* m) ;
int gsl_matrix_short_fwrite (FILE* stream, const(gsl_matrix_short)* m) ;
int gsl_matrix_short_fscanf (FILE* stream, gsl_matrix_short* m);
int gsl_matrix_short_fprintf (FILE* stream, const(gsl_matrix_short)* m, const(char)* format);
 
int gsl_matrix_short_memcpy(gsl_matrix_short* dest, const(gsl_matrix_short)* src);
int gsl_matrix_short_swap(gsl_matrix_short* m1, gsl_matrix_short* m2);

int gsl_matrix_short_swap_rows(gsl_matrix_short* m, const(size_t) i, const(size_t) j);
int gsl_matrix_short_swap_columns(gsl_matrix_short* m, const(size_t) i, const(size_t) j);
int gsl_matrix_short_swap_rowcol(gsl_matrix_short* m, const(size_t) i, const(size_t) j);
int gsl_matrix_short_transpose (gsl_matrix_short* m);
int gsl_matrix_short_transpose_memcpy (gsl_matrix_short* dest, const(gsl_matrix_short)* src);

short gsl_matrix_short_max (const(gsl_matrix_short)* m);
short gsl_matrix_short_min (const(gsl_matrix_short)* m);
void gsl_matrix_short_minmax (const(gsl_matrix_short)* m, short* min_out, short* max_out);

void gsl_matrix_short_max_index (const(gsl_matrix_short)* m, size_t* imax, size_t* jmax);
void gsl_matrix_short_min_index (const(gsl_matrix_short)* m, size_t* imin, size_t* jmin);
void gsl_matrix_short_minmax_index (const(gsl_matrix_short)* m, size_t* imin, size_t* jmin, size_t* imax, size_t* jmax);

int gsl_matrix_short_equal (const(gsl_matrix_short)* a, const(gsl_matrix_short)* b);

int gsl_matrix_short_isnull (const(gsl_matrix_short)* m);
int gsl_matrix_short_ispos (const(gsl_matrix_short)* m);
int gsl_matrix_short_isneg (const(gsl_matrix_short)* m);
int gsl_matrix_short_isnonneg (const(gsl_matrix_short)* m);

int gsl_matrix_short_add (gsl_matrix_short* a, const(gsl_matrix_short)* b);
int gsl_matrix_short_sub (gsl_matrix_short* a, const(gsl_matrix_short)* b);
int gsl_matrix_short_mul_elements (gsl_matrix_short* a, const(gsl_matrix_short)* b);
int gsl_matrix_short_div_elements (gsl_matrix_short* a, const(gsl_matrix_short)* b);
int gsl_matrix_short_scale (gsl_matrix_short* a, const(double) x);
int gsl_matrix_short_add_constant (gsl_matrix_short* a, const(double) x);
int gsl_matrix_short_add_diagonal (gsl_matrix_short* a, const(double) x);

/***********************************************************************/
/* The functions below are obsolete                                    */
/***********************************************************************/
int gsl_matrix_short_get_row(gsl_vector_short* v, const(gsl_matrix_short)* m, const(size_t) i);
int gsl_matrix_short_get_col(gsl_vector_short* v, const(gsl_matrix_short)* m, const(size_t) j);
int gsl_matrix_short_set_row(gsl_matrix_short* m, const(size_t) i, const(gsl_vector_short)* v);
int gsl_matrix_short_set_col(gsl_matrix_short* m, const(size_t) j, const(gsl_vector_short)* v);
/***********************************************************************/

/* inline functions if you are using GCC */

short   gsl_matrix_short_get(const(gsl_matrix_short)* m, const(size_t) i, const(size_t) j);
void    gsl_matrix_short_set(gsl_matrix_short* m, const(size_t) i, const(size_t) j, const(short) x);
short* gsl_matrix_short_ptr(gsl_matrix_short* m, const(size_t) i, const(size_t) j);
const(short)* gsl_matrix_short_const_ptr(const(gsl_matrix_short)* m, const(size_t) i, const(size_t) j);

}

