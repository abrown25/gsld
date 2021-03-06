module gsl.block_ushort;
/* block/gsl_block_ushort.h
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

struct gsl_block_ushort_struct
{
  size_t size;
  ushort* data;
};

alias gsl_block_ushort = gsl_block_ushort_struct;

gsl_block_ushort* gsl_block_ushort_alloc (const(size_t) n);
gsl_block_ushort* gsl_block_ushort_calloc (const(size_t) n);
void gsl_block_ushort_free (gsl_block_ushort* b);

int gsl_block_ushort_fread (FILE* stream, gsl_block_ushort* b);
int gsl_block_ushort_fwrite (FILE* stream, const(gsl_block_ushort)* b);
int gsl_block_ushort_fscanf (FILE* stream, gsl_block_ushort* b);
int gsl_block_ushort_fprintf (FILE* stream, const(gsl_block_ushort)* b, const(char)* format);

int gsl_block_ushort_raw_fread (FILE* stream, ushort* b, const(size_t) n, const(size_t) stride);
int gsl_block_ushort_raw_fwrite (FILE* stream, const(ushort)* b, const(size_t) n, const(size_t) stride);
int gsl_block_ushort_raw_fscanf (FILE* stream, ushort* b, const(size_t) n, const(size_t) stride);
int gsl_block_ushort_raw_fprintf (FILE* stream, const(ushort)* b, const(size_t) n, const(size_t) stride, const(char)* format);

size_t gsl_block_ushort_size (const(gsl_block_ushort)* b);
ushort* gsl_block_ushort_data (const(gsl_block_ushort)* b);

}

