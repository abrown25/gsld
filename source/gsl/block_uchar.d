module gsl.block_uchar;
/* block/gsl_block_uchar.h
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

struct gsl_block_uchar_struct
{
  size_t size;
  ubyte* data;
};

alias gsl_block_uchar = gsl_block_uchar_struct;

gsl_block_uchar* gsl_block_uchar_alloc (const(size_t) n);
gsl_block_uchar* gsl_block_uchar_calloc (const(size_t) n);
void gsl_block_uchar_free (gsl_block_uchar* b);

int gsl_block_uchar_fread (FILE* stream, gsl_block_uchar* b);
int gsl_block_uchar_fwrite (FILE* stream, const(gsl_block_uchar)* b);
int gsl_block_uchar_fscanf (FILE* stream, gsl_block_uchar* b);
int gsl_block_uchar_fprintf (FILE* stream, const(gsl_block_uchar)* b, const(char)* format);

int gsl_block_uchar_raw_fread (FILE* stream, ubyte* b, const(size_t) n, const(size_t) stride);
int gsl_block_uchar_raw_fwrite (FILE* stream, const(ubyte)* b, const(size_t) n, const(size_t) stride);
int gsl_block_uchar_raw_fscanf (FILE* stream, ubyte* b, const(size_t) n, const(size_t) stride);
int gsl_block_uchar_raw_fprintf (FILE* stream, const(ubyte)* b, const(size_t) n, const(size_t) stride, const(char)* format);

size_t gsl_block_uchar_size (const(gsl_block_uchar)* b);
ubyte* gsl_block_uchar_data (const(gsl_block_uchar)* b);

}

