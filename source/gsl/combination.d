module gsl.combination;
/* combination/gsl_combination.h
 * based on permutation/gsl_permutation.h by Brian Gough
 * 
 * Copyright (C) 2001 Szymon Jaroszewicz
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
* D interface file for gsl_combination.h
* Author: Chibisi Chima-Okereke
*/

import core.stdc.stdio: FILE;
import gsl.errno;
import gsl.check_range;

extern (C){

struct gsl_combination_struct
{
  size_t n;
  size_t k;
  size_t* data;
}

alias gsl_combination = gsl_combination_struct;

gsl_combination* gsl_combination_alloc (const(size_t) n, const(size_t) k);
gsl_combination* gsl_combination_calloc (const(size_t) n, const(size_t) k);
void gsl_combination_init_first (gsl_combination* c);
void gsl_combination_init_last (gsl_combination* c);
void gsl_combination_free (gsl_combination* c);
int gsl_combination_memcpy (gsl_combination* dest, const(gsl_combination)* src); 

int gsl_combination_fread (FILE* stream, gsl_combination* c);
int gsl_combination_fwrite (FILE* stream, const(gsl_combination)* c);
int gsl_combination_fscanf (FILE* stream, gsl_combination* c);
int gsl_combination_fprintf (FILE* stream, const(gsl_combination)* c, const(char)* format);

size_t gsl_combination_n (const(gsl_combination)* c);
size_t gsl_combination_k (const(gsl_combination)* c);
size_t* gsl_combination_data (const(gsl_combination)* c);

int gsl_combination_valid (gsl_combination* c);
int gsl_combination_next (gsl_combination* c);
int gsl_combination_prev (gsl_combination* c);

size_t gsl_combination_get (const(gsl_combination)* c, const(size_t) i);

}

