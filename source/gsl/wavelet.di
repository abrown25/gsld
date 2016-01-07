module gsl.wavelet;
/* 
 * Copyright (C) 2004 Ivo Alxneit
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
* D interface file for gsl_wavelet.h and gsl_wavelet2d.h
* Author: Chibisi Chima-Okereke
*/

import gsl.errno;

/*
#include <gsl/gsl_vector_double.h>
#include <gsl/gsl_matrix_double.h>
*/

extern (C){

enum gsl_wavelet_direction{
  gsl_wavelet_forward = 1, gsl_wavelet_backward = -1
}

struct gsl_wavelet_type
{
  const(char)* name;
  int function (const(double)** h1, const(double)** g1,
               const(double)** h2, const(double)** g2, size_t* nc,
               size_t * offset, size_t member) init;
}

struct gsl_wavelet
{
  const(gsl_wavelet_type)* type;
  const(double)* h1;
  const(double)* g1;
  const(double)* h2;
  const(double)* g2;
  size_t nc;
  size_t offset;
}

struct gsl_wavelet_workspace
{
  double* scratch;
  size_t n;
}

extern const(gsl_wavelet_type)* gsl_wavelet_daubechies;
extern const(gsl_wavelet_type)* gsl_wavelet_daubechies_centered;
extern const(gsl_wavelet_type)* gsl_wavelet_haar;
extern const(gsl_wavelet_type)* gsl_wavelet_haar_centered;
extern const(gsl_wavelet_type)* gsl_wavelet_bspline;
extern const(gsl_wavelet_type)* gsl_wavelet_bspline_centered;

gsl_wavelet* gsl_wavelet_alloc (const(gsl_wavelet_type)* T, size_t k);
void gsl_wavelet_free (gsl_wavelet* w);
const(char)* gsl_wavelet_name (const(gsl_wavelet_type)* w);

gsl_wavelet_workspace* gsl_wavelet_workspace_alloc (size_t n);
void gsl_wavelet_workspace_free (gsl_wavelet_workspace* work);

int gsl_wavelet_transform (const(gsl_wavelet_type)* w, 
                           double* data, size_t stride, size_t n,
                           gsl_wavelet_direction dir, 
                           gsl_wavelet_workspace* work);

int gsl_wavelet_transform_forward (const(gsl_wavelet_type)* w, 
                                   double* data, size_t stride, size_t n, 
                                   gsl_wavelet_workspace* work);

int gsl_wavelet_transform_inverse (const(gsl_wavelet_type)* w, 
                                    double* data, size_t stride, size_t n, 
                                    gsl_wavelet_workspace* work);

/* gsl_wavelet2d */

int gsl_wavelet2d_transform (const(gsl_wavelet)* w, 
                             double* data, 
                             size_t tda, size_t size1, size_t size2,
                             gsl_wavelet_direction dir, 
                             gsl_wavelet_workspace* work);

int gsl_wavelet2d_transform_forward (const(gsl_wavelet)* w, 
                                     double* data,
                                     size_t tda, size_t size1, size_t size2, 
                                     gsl_wavelet_workspace* work);

int gsl_wavelet2d_transform_inverse (const(gsl_wavelet)* w, 
                                     double* data, 
                                     size_t tda, size_t size1, size_t size2, 
                                     gsl_wavelet_workspace* work);

int gsl_wavelet2d_nstransform (const(gsl_wavelet)* w, 
                               double* data, 
                               size_t tda, size_t size1, size_t size2, 
                               gsl_wavelet_direction dir,
                               gsl_wavelet_workspace* work);

int gsl_wavelet2d_nstransform_forward (const(gsl_wavelet)* w, 
                                       double* data, 
                                       size_t tda, size_t size1, size_t size2,
                                       gsl_wavelet_workspace* work);

int gsl_wavelet2d_nstransform_inverse (const(gsl_wavelet)* w, 
                                       double* data, 
                                       size_t tda, size_t size1, size_t size2, 
                                       gsl_wavelet_workspace* work);

int
gsl_wavelet2d_transform_matrix (const(gsl_wavelet)* w, 
                                gsl_matrix* a, 
                                gsl_wavelet_direction dir, 
                                gsl_wavelet_workspace* work);

int
gsl_wavelet2d_transform_matrix_forward (const(gsl_wavelet)* w, 
                                        gsl_matrix* a, 
                                        gsl_wavelet_workspace* work);

int
gsl_wavelet2d_transform_matrix_inverse (const(gsl_wavelet)* w, 
                                        gsl_matrix* a, 
                                        gsl_wavelet_workspace* work);


int
gsl_wavelet2d_nstransform_matrix (const(gsl_wavelet)* w, 
                                  gsl_matrix* a, 
                                  gsl_wavelet_direction dir, 
                                  gsl_wavelet_workspace* work);

int
gsl_wavelet2d_nstransform_matrix_forward (const(gsl_wavelet)* w, 
                                          gsl_matrix* a, 
                                          gsl_wavelet_workspace* work);

int
gsl_wavelet2d_nstransform_matrix_inverse (const(gsl_wavelet)* w, 
                                          gsl_matrix* a, 
                                          gsl_wavelet_workspace* work);

}

