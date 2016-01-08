module gsl.cdf;
/* cdf/gsl_cdf.h
 * 
 * Copyright (C) 2002 Jason H. Stover.
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
 * along with this program; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
 */

/* Author:  J. Stover */
import unit_threaded: Name;

extern (C)
{
  double gsl_cdf_ugaussian_P(const double x);
  double gsl_cdf_ugaussian_Q(const double x);

  double gsl_cdf_ugaussian_Pinv(const double P);
  double gsl_cdf_ugaussian_Qinv(const double Q);

  double gsl_cdf_gaussian_P(const double x, const double sigma);
  double gsl_cdf_gaussian_Q(const double x, const double sigma);

  double gsl_cdf_gaussian_Pinv(const double P, const double sigma);
  double gsl_cdf_gaussian_Qinv(const double Q, const double sigma);

  double gsl_cdf_gamma_P(const double x, const double a, const double b);
  double gsl_cdf_gamma_Q(const double x, const double a, const double b);

  double gsl_cdf_gamma_Pinv(const double P, const double a, const double b);
  double gsl_cdf_gamma_Qinv(const double Q, const double a, const double b);

  double gsl_cdf_cauchy_P(const double x, const double a);
  double gsl_cdf_cauchy_Q(const double x, const double a);

  double gsl_cdf_cauchy_Pinv(const double P, const double a);
  double gsl_cdf_cauchy_Qinv(const double Q, const double a);

  double gsl_cdf_laplace_P(const double x, const double a);
  double gsl_cdf_laplace_Q(const double x, const double a);

  double gsl_cdf_laplace_Pinv(const double P, const double a);
  double gsl_cdf_laplace_Qinv(const double Q, const double a);

  double gsl_cdf_rayleigh_P(const double x, const double sigma);
  double gsl_cdf_rayleigh_Q(const double x, const double sigma);

  double gsl_cdf_rayleigh_Pinv(const double P, const double sigma);
  double gsl_cdf_rayleigh_Qinv(const double Q, const double sigma);

  double gsl_cdf_chisq_P(const double x, const double nu);
  double gsl_cdf_chisq_Q(const double x, const double nu);

  double gsl_cdf_chisq_Pinv(const double P, const double nu);
  double gsl_cdf_chisq_Qinv(const double Q, const double nu);

  double gsl_cdf_exponential_P(const double x, const double mu);
  double gsl_cdf_exponential_Q(const double x, const double mu);

  double gsl_cdf_exponential_Pinv(const double P, const double mu);
  double gsl_cdf_exponential_Qinv(const double Q, const double mu);

  double gsl_cdf_exppow_P(const double x, const double a, const double b);
  double gsl_cdf_exppow_Q(const double x, const double a, const double b);

  double gsl_cdf_tdist_P(const double x, const double nu);
  double gsl_cdf_tdist_Q(const double x, const double nu);

  double gsl_cdf_tdist_Pinv(const double P, const double nu);
  double gsl_cdf_tdist_Qinv(const double Q, const double nu);

  double gsl_cdf_fdist_P(const double x, const double nu1, const double nu2);
  double gsl_cdf_fdist_Q(const double x, const double nu1, const double nu2);

  double gsl_cdf_fdist_Pinv(const double P, const double nu1, const double nu2);
  double gsl_cdf_fdist_Qinv(const double Q, const double nu1, const double nu2);

  double gsl_cdf_beta_P(const double x, const double a, const double b);
  double gsl_cdf_beta_Q(const double x, const double a, const double b);

  double gsl_cdf_beta_Pinv(const double P, const double a, const double b);
  double gsl_cdf_beta_Qinv(const double Q, const double a, const double b);

  double gsl_cdf_flat_P(const double x, const double a, const double b);
  double gsl_cdf_flat_Q(const double x, const double a, const double b);

  double gsl_cdf_flat_Pinv(const double P, const double a, const double b);
  double gsl_cdf_flat_Qinv(const double Q, const double a, const double b);

  double gsl_cdf_lognormal_P(const double x, const double zeta, const double sigma);
  double gsl_cdf_lognormal_Q(const double x, const double zeta, const double sigma);

  double gsl_cdf_lognormal_Pinv(const double P, const double zeta, const double sigma);
  double gsl_cdf_lognormal_Qinv(const double Q, const double zeta, const double sigma);

  double gsl_cdf_gumbel1_P(const double x, const double a, const double b);
  double gsl_cdf_gumbel1_Q(const double x, const double a, const double b);

  double gsl_cdf_gumbel1_Pinv(const double P, const double a, const double b);
  double gsl_cdf_gumbel1_Qinv(const double Q, const double a, const double b);

  double gsl_cdf_gumbel2_P(const double x, const double a, const double b);
  double gsl_cdf_gumbel2_Q(const double x, const double a, const double b);

  double gsl_cdf_gumbel2_Pinv(const double P, const double a, const double b);
  double gsl_cdf_gumbel2_Qinv(const double Q, const double a, const double b);

  double gsl_cdf_weibull_P(const double x, const double a, const double b);
  double gsl_cdf_weibull_Q(const double x, const double a, const double b);

  double gsl_cdf_weibull_Pinv(const double P, const double a, const double b);
  double gsl_cdf_weibull_Qinv(const double Q, const double a, const double b);

  double gsl_cdf_pareto_P(const double x, const double a, const double b);
  double gsl_cdf_pareto_Q(const double x, const double a, const double b);

  double gsl_cdf_pareto_Pinv(const double P, const double a, const double b);
  double gsl_cdf_pareto_Qinv(const double Q, const double a, const double b);

  double gsl_cdf_logistic_P(const double x, const double a);
  double gsl_cdf_logistic_Q(const double x, const double a);

  double gsl_cdf_logistic_Pinv(const double P, const double a);
  double gsl_cdf_logistic_Qinv(const double Q, const double a);

  double gsl_cdf_binomial_P(const uint k, const double p, const uint n);
  double gsl_cdf_binomial_Q(const uint k, const double p, const uint n);

  double gsl_cdf_poisson_P(const uint k, const double mu);
  double gsl_cdf_poisson_Q(const uint k, const double mu);

  double gsl_cdf_geometric_P(const uint k, const double p);
  double gsl_cdf_geometric_Q(const uint k, const double p);

  double gsl_cdf_negative_binomial_P(const uint k, const double p, const double n);
  double gsl_cdf_negative_binomial_Q(const uint k, const double p, const double n);

  double gsl_cdf_pascal_P(const uint k, const double p, const uint n);
  double gsl_cdf_pascal_Q(const uint k, const double p, const uint n);

  double gsl_cdf_hypergeometric_P(const uint k, const uint n1, const uint n2, const uint t);
  double gsl_cdf_hypergeometric_Q(const uint k, const uint n1, const uint n2, const uint t);

}

@Name("LcdfFunctions")
unittest
{
  import std.math : approxEqual;
  import std.stdio;

  //tested against examples from R

  assert(approxEqual(gsl_cdf_ugaussian_P(1.96), 0.9750021));
  //pnorm(1.96)

  assert(approxEqual(gsl_cdf_ugaussian_Q(1.96), 0.0249979));
  //1 - pnorm(1.96)

  assert(approxEqual(gsl_cdf_ugaussian_Pinv(0.53), 0.07526986));
  //qnorm(0.53)

  assert(approxEqual(gsl_cdf_ugaussian_Qinv(0.36), 0.3584588));
  //qnorm(1 - 0.36)

  assert(approxEqual(gsl_cdf_gaussian_P(1.96, 2), 0.8364569));
  //pnorm(1.96, sd = 2)

  assert(approxEqual(gsl_cdf_gaussian_Q(1.54, 3), 0.3038591));
  //1 - pnorm(1.54, sd = 3)

  // assert(approxEqual( gsl_cdf_gaussian_Pinv (const double P, const double sigma));
  // assert(approxEqual( gsl_cdf_gaussian_Qinv (const double Q, const double sigma));

  // assert(approxEqual( gsl_cdf_gamma_P (const double x, const double a, const double b));
  // assert(approxEqual( gsl_cdf_gamma_Q (const double x, const double a, const double b));

  // assert(approxEqual( gsl_cdf_gamma_Pinv (const double P, const double a, const double b));
  // assert(approxEqual( gsl_cdf_gamma_Qinv (const double Q, const double a, const double b));

  // assert(approxEqual( gsl_cdf_cauchy_P (const double x, const double a));
  // assert(approxEqual( gsl_cdf_cauchy_Q (const double x, const double a));

  // assert(approxEqual( gsl_cdf_cauchy_Pinv (const double P, const double a));
  // assert(approxEqual( gsl_cdf_cauchy_Qinv (const double Q, const double a));

  // assert(approxEqual( gsl_cdf_laplace_P (const double x, const double a));
  // assert(approxEqual( gsl_cdf_laplace_Q (const double x, const double a));

  // assert(approxEqual( gsl_cdf_laplace_Pinv (const double P, const double a));
  // assert(approxEqual( gsl_cdf_laplace_Qinv (const double Q, const double a));

  // assert(approxEqual( gsl_cdf_rayleigh_P (const double x, const double sigma));
  // assert(approxEqual( gsl_cdf_rayleigh_Q (const double x, const double sigma));

  // assert(approxEqual( gsl_cdf_rayleigh_Pinv (const double P, const double sigma));
  // assert(approxEqual( gsl_cdf_rayleigh_Qinv (const double Q, const double sigma));

  // assert(approxEqual( gsl_cdf_chisq_P (const double x, const double nu));
  // assert(approxEqual( gsl_cdf_chisq_Q (const double x, const double nu));

  // assert(approxEqual( gsl_cdf_chisq_Pinv (const double P, const double nu));
  // assert(approxEqual( gsl_cdf_chisq_Qinv (const double Q, const double nu));

  // assert(approxEqual( gsl_cdf_exponential_P (const double x, const double mu));
  // assert(approxEqual( gsl_cdf_exponential_Q (const double x, const double mu));

  // assert(approxEqual( gsl_cdf_exponential_Pinv (const double P, const double mu));
  // assert(approxEqual( gsl_cdf_exponential_Qinv (const double Q, const double mu));

  // assert(approxEqual( gsl_cdf_exppow_P (const double x, const double a, const double b));
  // assert(approxEqual( gsl_cdf_exppow_Q (const double x, const double a, const double b));

  // assert(approxEqual( gsl_cdf_tdist_P (const double x, const double nu));
  // assert(approxEqual( gsl_cdf_tdist_Q (const double x, const double nu));

  // assert(approxEqual( gsl_cdf_tdist_Pinv (const double P, const double nu));
  // assert(approxEqual( gsl_cdf_tdist_Qinv (const double Q, const double nu));

  // assert(approxEqual( gsl_cdf_fdist_P (const double x, const double nu1, const double nu2));
  // assert(approxEqual( gsl_cdf_fdist_Q (const double x, const double nu1, const double nu2));

  // assert(approxEqual( gsl_cdf_fdist_Pinv (const double P, const double nu1, const double nu2));
  // assert(approxEqual( gsl_cdf_fdist_Qinv (const double Q, const double nu1, const double nu2));

  // assert(approxEqual( gsl_cdf_beta_P (const double x, const double a, const double b));
  // assert(approxEqual( gsl_cdf_beta_Q (const double x, const double a, const double b));

  // assert(approxEqual( gsl_cdf_beta_Pinv (const double P, const double a, const double b));
  // assert(approxEqual( gsl_cdf_beta_Qinv (const double Q, const double a, const double b));

  // assert(approxEqual( gsl_cdf_flat_P (const double x, const double a, const double b));
  // assert(approxEqual( gsl_cdf_flat_Q (const double x, const double a, const double b));

  // assert(approxEqual( gsl_cdf_flat_Pinv (const double P, const double a, const double b));
  // assert(approxEqual( gsl_cdf_flat_Qinv (const double Q, const double a, const double b));

  // assert(approxEqual( gsl_cdf_lognormal_P (const double x, const double zeta, const double sigma));
  // assert(approxEqual( gsl_cdf_lognormal_Q (const double x, const double zeta, const double sigma));

  // assert(approxEqual( gsl_cdf_lognormal_Pinv (const double P, const double zeta, const double sigma));
  // assert(approxEqual( gsl_cdf_lognormal_Qinv (const double Q, const double zeta, const double sigma));

  // assert(approxEqual( gsl_cdf_gumbel1_P (const double x, const double a, const double b));
  // assert(approxEqual( gsl_cdf_gumbel1_Q (const double x, const double a, const double b));

  // assert(approxEqual( gsl_cdf_gumbel1_Pinv (const double P, const double a, const double b));
  // assert(approxEqual( gsl_cdf_gumbel1_Qinv (const double Q, const double a, const double b));

  // assert(approxEqual( gsl_cdf_gumbel2_P (const double x, const double a, const double b));
  // assert(approxEqual( gsl_cdf_gumbel2_Q (const double x, const double a, const double b));

  // assert(approxEqual( gsl_cdf_gumbel2_Pinv (const double P, const double a, const double b));
  // assert(approxEqual( gsl_cdf_gumbel2_Qinv (const double Q, const double a, const double b));

  // assert(approxEqual( gsl_cdf_weibull_P (const double x, const double a, const double b));
  // assert(approxEqual( gsl_cdf_weibull_Q (const double x, const double a, const double b));

  // assert(approxEqual( gsl_cdf_weibull_Pinv (const double P, const double a, const double b));
  // assert(approxEqual( gsl_cdf_weibull_Qinv (const double Q, const double a, const double b));

  // assert(approxEqual( gsl_cdf_pareto_P (const double x, const double a, const double b));
  // assert(approxEqual( gsl_cdf_pareto_Q (const double x, const double a, const double b));

  // assert(approxEqual( gsl_cdf_pareto_Pinv (const double P, const double a, const double b));
  // assert(approxEqual( gsl_cdf_pareto_Qinv (const double Q, const double a, const double b));

  // assert(approxEqual( gsl_cdf_logistic_P (const double x, const double a));
  // assert(approxEqual( gsl_cdf_logistic_Q (const double x, const double a));

  // assert(approxEqual( gsl_cdf_logistic_Pinv (const double P, const double a));
  // assert(approxEqual( gsl_cdf_logistic_Qinv (const double Q, const double a));

  // assert(approxEqual( gsl_cdf_binomial_P (const uint k, const double p, const uint n));
  // assert(approxEqual( gsl_cdf_binomial_Q (const uint k, const double p, const uint n));

  // assert(approxEqual( gsl_cdf_poisson_P (const uint k, const double mu));
  // assert(approxEqual( gsl_cdf_poisson_Q (const uint k, const double mu));

  // assert(approxEqual( gsl_cdf_geometric_P (const uint k, const double p));
  // assert(approxEqual( gsl_cdf_geometric_Q (const uint k, const double p));

  // assert(approxEqual( gsl_cdf_negative_binomial_P (const uint k, const double p, const double n));
  // assert(approxEqual( gsl_cdf_negative_binomial_Q (const uint k, const double p, const double n));

  // assert(approxEqual( gsl_cdf_pascal_P (const uint k, const double p, const uint n));
  // assert(approxEqual( gsl_cdf_pascal_Q (const uint k, const double p, const uint n));

  // assert(approxEqual( gsl_cdf_hypergeometric_P (const uint k, const uint n1,
  //                                  const uint n2, const uint t));
  // assert(approxEqual( gsl_cdf_hypergeometric_Q (const uint k, const uint n1,
  //                                  const uint n2, const uint t));
}
