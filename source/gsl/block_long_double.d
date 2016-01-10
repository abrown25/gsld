module gsl.block_long_double;
/* block/gsl_block_long_double.h
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

import core.stdc.stdio: FILE;
import gsl.errno;

extern (C){

struct gsl_block_long_double_struct
{
  size_t size;
  real* data;
};

alias gsl_block_long_double = gsl_block_long_double_struct;

gsl_block_long_double* gsl_block_long_double_alloc (const(size_t) n);
gsl_block_long_double* gsl_block_long_double_calloc (const(size_t) n);
void gsl_block_long_double_free (gsl_block_long_double* b);

int gsl_block_long_double_fread (FILE* stream, gsl_block_long_double* b);
int gsl_block_long_double_fwrite (FILE* stream, const(gsl_block_long_double)* b);
int gsl_block_long_double_fscanf (FILE* stream, gsl_block_long_double* b);
int gsl_block_long_double_fprintf (FILE* stream, const(gsl_block_long_double)* b, const(char)* format);

int gsl_block_long_double_raw_fread (FILE* stream, real* b, const(size_t) n, const(size_t) stride);
int gsl_block_long_double_raw_fwrite (FILE* stream, const(real)* b, const(size_t) n, const(size_t) stride);
int gsl_block_long_double_raw_fscanf (FILE* stream, real* b, const(size_t) n, const(size_t) stride);
int gsl_block_long_double_raw_fprintf (FILE* stream, const(real)* b, const(size_t) n, const(size_t) stride, const(char)* format);

size_t gsl_block_long_double_size (const(gsl_block_long_double)* b);
real* gsl_block_long_double_data (const(gsl_block_long_double)* b);

}

