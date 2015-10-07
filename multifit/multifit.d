module multifit.gsl_multifit;
/* multifit/gsl_multifit.h
 * 
 * Copyright (C) 2000, 2007, 2010 Brian Gough
 * Copyright (C) 2013, Patrick Alken
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

import matrix.gsl_matrix_double;
import vector.gsl_vector_double;
import block.gsl_block_double;

extern (C)
{
  struct gsl_multifit_linear_workspace 
  {
    size_t n; /* number of observations */
    size_t p; /* number of parameters */
    gsl_matrix * A;
    gsl_matrix * Q;
    gsl_matrix * QSI;
    gsl_vector * S;
    gsl_vector * t;
    gsl_vector * xt;
    gsl_vector * D;
  };

  gsl_multifit_linear_workspace *
    gsl_multifit_linear_alloc (size_t n, size_t p);

  void
    gsl_multifit_linear_free (gsl_multifit_linear_workspace * work);

  int
    gsl_multifit_linear (const gsl_matrix * X,
			 const gsl_vector * y,
			 gsl_vector * c,
			 gsl_matrix * cov,
			 double * chisq,
			 gsl_multifit_linear_workspace * work);

  int
    gsl_multifit_linear_svd (const gsl_matrix * X,
			     const gsl_vector * y,
			     double tol,
			     size_t * rank,
			     gsl_vector * c,
			     gsl_matrix * cov,
			     double *chisq, 
			     gsl_multifit_linear_workspace * work);

  int
    gsl_multifit_linear_usvd (const gsl_matrix * X,
			      const gsl_vector * y,
			      double tol,
			      size_t * rank,
			      gsl_vector * c,
			      gsl_matrix * cov,
			      double *chisq, 
			      gsl_multifit_linear_workspace * work);

  int
    gsl_multifit_wlinear (const gsl_matrix * X,
			  const gsl_vector * w,
			  const gsl_vector * y,
			  gsl_vector * c,
			  gsl_matrix * cov,
			  double * chisq,
			  gsl_multifit_linear_workspace * work);

  int
    gsl_multifit_wlinear_svd (const gsl_matrix * X,
			      const gsl_vector * w,
			      const gsl_vector * y,
			      double tol,
			      size_t * rank,
			      gsl_vector * c,
			      gsl_matrix * cov,
			      double *chisq, 
			      gsl_multifit_linear_workspace * work);

  int
    gsl_multifit_wlinear_usvd (const gsl_matrix * X,
			       const gsl_vector * w,
			       const gsl_vector * y,
			       double tol,
			       size_t * rank,
			       gsl_vector * c,
			       gsl_matrix * cov,
			       double *chisq, 
			       gsl_multifit_linear_workspace * work);

  int
    gsl_multifit_linear_est (const gsl_vector * x,
			     const gsl_vector * c,
			     const gsl_matrix * cov, double *y, double *y_err);

  int
    gsl_multifit_linear_residuals (const gsl_matrix *X, const gsl_vector *y,
				   const gsl_vector *c, gsl_vector *r);

  struct gsl_multifit_robust_type
  {
    const char * name;     /* method name */
    extern(C)
    {
      int wfun (const gsl_vector *r, gsl_vector *w);
      int psi_deriv (const gsl_vector *r, gsl_vector *dpsi);
    }
    double tuning_default; /* default tuning constant */
  };

  struct gsl_multifit_robust_stats
  {
    double sigma_ols;    /* OLS estimate of sigma */
    double sigma_mad;    /* MAD estimate of sigma */
    double sigma_rob;    /* robust estimate of sigma */
    double sigma;        /* final estimate of sigma */
    double Rsq;          /* R^2 coefficient of determination */
    double adj_Rsq;      /* degree of freedom adjusted R^2 */
    double rmse;         /* root mean squared error */
    double sse;          /* residual sum of squares */
    size_t dof;          /* degrees of freedom */
    size_t numit;        /* number of iterations */
    gsl_vector *weights; /* final weights */
    gsl_vector *r;       /* final residuals y - X c */
  };

  struct gsl_multifit_robust_workspace
  {
    size_t n;            /* number of observations */
    size_t p;            /* number of parameters */
    size_t numit;        /* number of iterations */
    size_t maxiter;      /* maximum iterations */
    const gsl_multifit_robust_type *type;
    double tune;         /* tuning parameter */

    gsl_vector *r;       /* residuals at current iteration */
    gsl_vector *weights; /* weights at current iteration */
    gsl_vector *c_prev;  /* coefficients from previous iteration */
    gsl_vector *resfac;  /* multiplicative factors for residuals */

    gsl_vector *psi;     /* psi(r) */
    gsl_vector *dpsi;    /* psi'(r) */

    gsl_matrix *QSI;     /* Q S^{-1} of original matrix X */
    gsl_vector *D;       /* balancing parameters of original matrix X */

    gsl_vector *workn;   /* workspace of length n */

    gsl_multifit_robust_stats stats; /* various statistics */

    gsl_multifit_linear_workspace *multifit_p;
  };

 gsl_multifit_robust_workspace *gsl_multifit_robust_alloc(const gsl_multifit_robust_type *T,
							  const size_t n, const size_t p);
 void gsl_multifit_robust_free(gsl_multifit_robust_workspace *w);
 int gsl_multifit_robust_tune(const double tune, gsl_multifit_robust_workspace *w);
 char gsl_multifit_robust_name(const gsl_multifit_robust_workspace *w);
 gsl_multifit_robust_stats gsl_multifit_robust_statistics(const gsl_multifit_robust_workspace *w);
 int gsl_multifit_robust(const gsl_matrix * X, const gsl_vector * y,
			 gsl_vector * c, gsl_matrix *cov,
			 gsl_multifit_robust_workspace *w);
 int gsl_multifit_robust_est(const gsl_vector * x, const gsl_vector * c,
			     const gsl_matrix * cov, double *y, double *y_err);

 double gsl_cdf_tdist_P(double x, double nu);
}

gsl_vector* d_gsl_vector_set(double[] vector);
gsl_matrix* d_gsl_matrix_set(double[] matrix, size_t nRow);

double[] d_gsl_regress_covariates(double[] outcome, double[] covariates)
{
  double[] coefficients;
  size_t nRow = outcome.length;
  size_t nCol = covariates.length / nRow;
  coefficients.length = nCol;
  

  gsl_vector* r = gsl_vector_alloc(nRow);
  gsl_vector* c = gsl_vector_alloc(nCol);
  gsl_matrix* covariance = gsl_matrix_alloc(nCol, nCol);
  double chisq;
  double tol = 2.3e-16;
  size_t rank = 0;

  gsl_matrix * cov = gsl_matrix_alloc(nRow, nCol);

  foreach (i; 0 .. nRow)
  {
    foreach (j; 0 .. nCol)
    {
      gsl_matrix_set(cov, i, j, covariates[i + j * nRow]);
    }
  }
  gsl_vector * out_ = gsl_vector_alloc(outcome.length);

  foreach (i; 0 .. outcome.length)
  {
    gsl_vector_set(out_, i, outcome[i]);
  }

  // gsl_vector* out_ = d_gsl_vector_set(outcome);
  // gsl_matrix* cov = d_gsl_matrix_set(covariates, nRow);
  gsl_multifit_linear_workspace* work = gsl_multifit_linear_alloc(nRow, nCol);

  gsl_multifit_linear(cov, out_, c, covariance, &chisq, work);

  foreach(i; 0 .. nCol)
  {
    coefficients[i] = gsl_vector_get(c, i);
  }
  gsl_multifit_linear_free(work);
  gsl_matrix_free(cov);
  gsl_matrix_free(covariance);
  gsl_vector_free(out_);
  gsl_vector_free(r);
  gsl_vector_free(c);
  
  return coefficients;
}

double[] d_gsl_regress_pValues(double[] outcome, double[] covariates)
{
  import std.math : fabs, sqrt;
  
  double[] pValues;
  size_t nRow = outcome.length;
  size_t nCol = covariates.length / nRow;
  pValues.length = nCol;
  

  gsl_vector* r = gsl_vector_alloc(nRow);
  gsl_vector* c = gsl_vector_alloc(nCol);
  gsl_matrix* covariance = gsl_matrix_alloc(nCol, nCol);
  double chisq;
  double tol = 2.3e-16;
  size_t rank = 0;

  gsl_matrix * cov = gsl_matrix_alloc(nRow, nCol);

  foreach (i; 0 .. nRow)
  {
    foreach (j; 0 .. nCol)
    {
      gsl_matrix_set(cov, i, j, covariates[i + j * nRow]);
    }
  }
  gsl_vector * out_ = gsl_vector_alloc(outcome.length);

  foreach (i; 0 .. outcome.length)
  {
    gsl_vector_set(out_, i, outcome[i]);
  }

  // gsl_vector* out_ = d_gsl_vector_set(outcome);
  // gsl_matrix* cov = d_gsl_matrix_set(covariates, nRow);
  gsl_multifit_linear_workspace* work = gsl_multifit_linear_alloc(nRow, nCol);

  gsl_multifit_linear(cov, out_, c, covariance, &chisq, work);

  foreach(i; 0 .. nCol)
  {
    pValues[i] = gsl_cdf_tdist_P(-fabs(gsl_vector_get(c, i) / sqrt(gsl_matrix_get(covariance, i, i))), nRow - nCol) * 2;
  }
  
  gsl_multifit_linear_free(work);
  gsl_matrix_free(cov);
  gsl_matrix_free(covariance);
  gsl_vector_free(out_);
  gsl_vector_free(r);
  gsl_vector_free(c);
  
  return pValues;
}

unittest
{
  import std.math : approxEqual;
  import std.range : zip;
  //Runs a sample linear regression and checks values against R residuals, tests standard, svd, and usvd methods
  double[] residualsFromR = [
			     1.5906235, -3.1706428, -0.5620203, 0.9473047, 0.5761592
			     ];

  double[] coeffFromR = [0.9493024, 0.2414637, 0.2221814, 0.2872682];
  double[] pFromR = [0.6701421, 0.8518896, 0.8705691, 0.7709841];

  size_t nInd = 5;
  size_t nCov = 4;
  double[] x = [1, 2, 1, 5, 1, 9, 5, 1, 1, 2, 9, 8, 1, 8, 7, 1, 1, 4, 1, 5];
  double[] y = [7, 2, 2, 8, 5];
  
  double[] helperResults = d_gsl_regress_covariates(y, x);
  foreach(i, j; zip(coeffFromR, helperResults))
  {
    assert(approxEqual(i, j));
  }

  helperResults = d_gsl_regress_pValues(y, x);
  foreach(i, j; zip(pFromR, helperResults))
  {
    assert(approxEqual(i, j));
  }

  gsl_vector* yVec = gsl_vector_alloc(nInd);
  gsl_vector* r = gsl_vector_alloc(nInd);
  gsl_vector* c = gsl_vector_alloc(nCov);
  gsl_matrix* xMat = gsl_matrix_alloc(nInd, nCov);
  gsl_matrix* cov = gsl_matrix_alloc(nCov, nCov);
  double chisq;
  double tol = 2.3e-16;
  size_t rank = 0;

  foreach (i; 0 .. nInd)
  {
    gsl_vector_set(yVec, i, y[i]);
    foreach (j; 0 .. nCov)
    {
      gsl_matrix_set(xMat, i, j, x[i + j * nInd]);
    }
  }

  gsl_multifit_linear_workspace* work = gsl_multifit_linear_alloc(nInd, nCov);

  gsl_multifit_linear(xMat, yVec, c, cov, &chisq, work);

  foreach(i; 0 .. nCov)
  {
    assert(approxEqual(coeffFromR[i], gsl_vector_get(c, i)));
  }
  
  gsl_multifit_linear_residuals(xMat, yVec, c, r);

  foreach (i; 0 .. nInd)
  {
    assert(approxEqual(residualsFromR[i], gsl_vector_get(r, i)));
  }

  gsl_multifit_linear_svd(xMat, yVec, tol, &rank, c, cov, &chisq, work);

  foreach(i; 0 .. nCov)
  {
    assert(approxEqual(coeffFromR[i], gsl_vector_get(c, i)));
  }
  
  gsl_multifit_linear_residuals(xMat, yVec, c, r);

  foreach (i; 0 .. nInd)
  {
    assert(approxEqual(residualsFromR[i], gsl_vector_get(r, i)));
  }

  gsl_multifit_linear_usvd(xMat, yVec, tol, &rank, c, cov, &chisq, work);

  foreach(i; 0 .. nCov)
  {
    assert(approxEqual(coeffFromR[i], gsl_vector_get(c, i)));
  }
  
  gsl_multifit_linear_residuals(xMat, yVec, c, r);

  foreach (i; 0 .. nInd)
  {
    assert(approxEqual(residualsFromR[i], gsl_vector_get(r, i)));
  }

  gsl_multifit_linear_free(work);
  gsl_matrix_free(xMat);
  gsl_matrix_free(cov);
  gsl_vector_free(yVec);
  gsl_vector_free(r);
  gsl_vector_free(c);
}

unittest
{
  import std.math : approxEqual;  

  //Runs a sample linear regression on a degenerate X matrix with svd, and usvd methods
  double[] residualsFromR = [
			     2.022629660, -3.177704792, 0.008012416, 0.854200503, 0.053764993];

  //R drops second covariate, gsl splits covariate signal across first two variables
  double[] coeffFromR = [ 0.3280158, 0.3280158, 0.4556971, 0.2200647];

  size_t nInd = 5;
  size_t nCov = 4;
  double[] x = [1, 2, 1, 5, 1, 1, 2, 1, 5, 1, 9, 8, 1, 8, 7, 1, 1, 4, 1, 5];
  double[] y = [7, 2, 2, 8, 5];

  gsl_vector* yVec = gsl_vector_alloc(nInd);
  gsl_vector* r = gsl_vector_alloc(nInd);
  gsl_vector* c = gsl_vector_alloc(nCov);
  gsl_matrix* xMat = gsl_matrix_alloc(nInd, nCov);
  gsl_matrix* cov = gsl_matrix_alloc(nCov, nCov);
  double chisq;
  double tol = 2.3e-16;
  size_t rank = 0;

  foreach (i; 0 .. nInd)
  {
    gsl_vector_set(yVec, i, y[i]);
    foreach (j; 0 .. nCov)
    {
      gsl_matrix_set(xMat, i, j, x[i + j * nInd]);
    }
  }

  gsl_multifit_linear_workspace* work = gsl_multifit_linear_alloc(nInd, nCov);

  gsl_multifit_linear_svd(xMat, yVec, tol, &rank, c, cov, &chisq, work);
  import std.stdio;

  assert(rank == 3);

  foreach(i; 0 .. nCov)
  {
       assert(approxEqual(coeffFromR[i], gsl_vector_get(c, i)));
  }
  
  gsl_multifit_linear_residuals(xMat, yVec, c, r);

  foreach (i; 0 .. nInd)
  {
    assert(approxEqual(residualsFromR[i], gsl_vector_get(r, i)));
  }
  rank = 100;
  gsl_multifit_linear_usvd(xMat, yVec, tol, &rank, c, cov, &chisq, work);

  assert(rank == 3);
  foreach(i; 0 .. nCov)
  {
    assert(approxEqual(coeffFromR[i], gsl_vector_get(c, i)));
  }
  
  gsl_multifit_linear_residuals(xMat, yVec, c, r);

  foreach (i; 0 .. nInd)
  {
    assert(approxEqual(residualsFromR[i], gsl_vector_get(r, i)));
  }

  gsl_multifit_linear_free(work);
  gsl_matrix_free(xMat);
  gsl_matrix_free(cov);
  gsl_vector_free(yVec);
  gsl_vector_free(r);
  gsl_vector_free(c);
}
