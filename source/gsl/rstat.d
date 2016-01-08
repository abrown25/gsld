module gsl.rstat;
/* rstat/gsl_rstat.h
 * 
 * Copyright (C) 2015 Patrick Alken
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
* D interface file for gsl_rstat.h
* Author: Chibisi Chima-Okereke
*/

extern (C){


struct gsl_rstat_quantile_workspace
{
  double p;        /* p-quantile */
  double q[5];     /* heights q_i */
  int npos[5];     /* positions n_i */
  double np[5];    /* desired positions n_i' */
  double dnp[5];   /* increments dn_i' */
  size_t n;        /* number of data added */
}

gsl_rstat_quantile_workspace* gsl_rstat_quantile_alloc(const(double) p);
void gsl_rstat_quantile_free(gsl_rstat_quantile_workspace* w);
int gsl_rstat_quantile_add(const(double) x, gsl_rstat_quantile_workspace* w);
double gsl_rstat_quantile_get(gsl_rstat_quantile_workspace* w);

struct gsl_rstat_workspace
{
  double min;      /* minimum value added */
  double max;      /* maximum value added */
  double mean;     /* current mean */
  double M2;       /* M_k = sum_{i=1..n} [ x_i - mean_n ]^k */
  double M3;
  double M4;
  size_t n;        /* number of data points added */
  gsl_rstat_quantile_workspace* median_workspace_p; /* median workspace */
}

gsl_rstat_workspace* gsl_rstat_alloc();
void gsl_rstat_free(gsl_rstat_workspace* w);
size_t gsl_rstat_n(gsl_rstat_workspace* w);
int gsl_rstat_add(const(double) x, gsl_rstat_workspace* w);
double gsl_rstat_min(gsl_rstat_workspace* w);
double gsl_rstat_max(gsl_rstat_workspace* w);
double gsl_rstat_mean(gsl_rstat_workspace* w);
double gsl_rstat_variance(gsl_rstat_workspace* w);
double gsl_rstat_sd(gsl_rstat_workspace* w);
double gsl_rstat_sd_mean(gsl_rstat_workspace* w);
double gsl_rstat_median(gsl_rstat_workspace* w);
double gsl_rstat_skew(gsl_rstat_workspace* w);
double gsl_rstat_kurtosis(gsl_rstat_workspace* w);
int gsl_rstat_reset(gsl_rstat_workspace* w);

}

