module gsl.rng;
/* rng/gsl_rng.h
 * 
 * Copyright (C) 1996, 1997, 1998, 1999, 2000, 2004, 2007 James Theiler, Brian Gough
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

import core.stdc.stdio : FILE;

import unit_threaded : Name;

extern (C)
{
  struct gsl_rng_type
  {
    const char* name;
    ulong max;
    ulong min;
    size_t size;
    void function(void* state, ulong seed) set;
    ulong function(void* state) get;
    double function(void* state) get_double;
  }

  struct gsl_rng
  {
    gsl_rng_type* type;
    void* state;
  }

  ///* These structs also need to appear in default.c so you can select
  //   them via the environment variable GSL_RNG_TYPE */

  extern __gshared const gsl_rng_type* gsl_rng_borosh13;
  extern __gshared const gsl_rng_type* gsl_rng_coveyou;
  extern __gshared const gsl_rng_type* gsl_rng_cmrg;
  extern __gshared const gsl_rng_type* gsl_rng_fishman18;
  extern __gshared const gsl_rng_type* gsl_rng_fishman20;
  extern __gshared const gsl_rng_type* gsl_rng_fishman2x;
  extern __gshared const gsl_rng_type* gsl_rng_gfsr4;
  extern __gshared const gsl_rng_type* gsl_rng_knuthran;
  extern __gshared const gsl_rng_type* gsl_rng_knuthran2;
  extern __gshared const gsl_rng_type* gsl_rng_knuthran2002;
  extern __gshared const gsl_rng_type* gsl_rng_lecuyer21;
  extern __gshared const gsl_rng_type* gsl_rng_minstd;
  extern __gshared const gsl_rng_type* gsl_rng_mrg;
  extern __gshared const gsl_rng_type* gsl_rng_mt19937;
  extern __gshared const gsl_rng_type* gsl_rng_mt19937_1999;
  extern __gshared const gsl_rng_type* gsl_rng_mt19937_1998;
  extern __gshared const gsl_rng_type* gsl_rng_r250;
  extern __gshared const gsl_rng_type* gsl_rng_ran0;
  extern __gshared const gsl_rng_type* gsl_rng_ran1;
  extern __gshared const gsl_rng_type* gsl_rng_ran2;
  extern __gshared const gsl_rng_type* gsl_rng_ran3;
  extern __gshared const gsl_rng_type* gsl_rng_rand;
  extern __gshared const gsl_rng_type* gsl_rng_rand48;
  extern __gshared const gsl_rng_type* gsl_rng_random128_bsd;
  extern __gshared const gsl_rng_type* gsl_rng_random128_glibc2;
  extern __gshared const gsl_rng_type* gsl_rng_random128_libc5;
  extern __gshared const gsl_rng_type* gsl_rng_random256_bsd;
  extern __gshared const gsl_rng_type* gsl_rng_random256_glibc2;
  extern __gshared const gsl_rng_type* gsl_rng_random256_libc5;
  extern __gshared const gsl_rng_type* gsl_rng_random32_bsd;
  extern __gshared const gsl_rng_type* gsl_rng_random32_glibc2;
  extern __gshared const gsl_rng_type* gsl_rng_random32_libc5;
  extern __gshared const gsl_rng_type* gsl_rng_random64_bsd;
  extern __gshared const gsl_rng_type* gsl_rng_random64_glibc2;
  extern __gshared const gsl_rng_type* gsl_rng_random64_libc5;
  extern __gshared const gsl_rng_type* gsl_rng_random8_bsd;
  extern __gshared const gsl_rng_type* gsl_rng_random8_glibc2;
  extern __gshared const gsl_rng_type* gsl_rng_random8_libc5;
  extern __gshared const gsl_rng_type* gsl_rng_random_bsd;
  extern __gshared const gsl_rng_type* gsl_rng_random_glibc2;
  extern __gshared const gsl_rng_type* gsl_rng_random_libc5;
  extern __gshared const gsl_rng_type* gsl_rng_randu;
  extern __gshared const gsl_rng_type* gsl_rng_ranf;
  extern __gshared const gsl_rng_type* gsl_rng_ranlux;
  extern __gshared const gsl_rng_type* gsl_rng_ranlux389;
  extern __gshared const gsl_rng_type* gsl_rng_ranlxd1;
  extern __gshared const gsl_rng_type* gsl_rng_ranlxd2;
  extern __gshared const gsl_rng_type* gsl_rng_ranlxs0;
  extern __gshared const gsl_rng_type* gsl_rng_ranlxs1;
  extern __gshared const gsl_rng_type* gsl_rng_ranlxs2;
  extern __gshared const gsl_rng_type* gsl_rng_ranmar;
  extern __gshared const gsl_rng_type* gsl_rng_slatec;
  extern __gshared const gsl_rng_type* gsl_rng_taus;
  extern __gshared const gsl_rng_type* gsl_rng_taus2;
  extern __gshared const gsl_rng_type* gsl_rng_taus113;
  extern __gshared const gsl_rng_type* gsl_rng_transputer;
  extern __gshared const gsl_rng_type* gsl_rng_tt800;
  extern __gshared const gsl_rng_type* gsl_rng_uni;
  extern __gshared const gsl_rng_type* gsl_rng_uni32;
  extern __gshared const gsl_rng_type* gsl_rng_vax;
  extern __gshared const gsl_rng_type* gsl_rng_waterman14;
  extern __gshared const gsl_rng_type* gsl_rng_zuf;

  gsl_rng_type** gsl_rng_types_setup();

  extern __gshared gsl_rng_type* gsl_rng_default;
  extern __gshared ulong gsl_rng_default_seed;

  gsl_rng* gsl_rng_alloc(const gsl_rng_type* T);
  int gsl_rng_memcpy(gsl_rng* dest, const gsl_rng* src);
  gsl_rng* gsl_rng_clone(const gsl_rng* r);

  void gsl_rng_free(gsl_rng* r);

  void gsl_rng_set(const gsl_rng* r, ulong seed);
  ulong gsl_rng_max(const gsl_rng* r);
  ulong gsl_rng_min(const gsl_rng* r);
  const(char)* gsl_rng_name(const gsl_rng* r);

  int gsl_rng_fread(FILE* stream, gsl_rng* r);
  int gsl_rng_fwrite(FILE* stream, const gsl_rng* r);

  size_t gsl_rng_size(const gsl_rng* r);
  void* gsl_rng_state(const gsl_rng* r);

  void gsl_rng_print_state(const gsl_rng* r);

  gsl_rng_type* gsl_rng_env_setup();

  ulong gsl_rng_get(const gsl_rng* r);
  double gsl_rng_uniform(const gsl_rng* r);
  double gsl_rng_uniform_pos(const gsl_rng* r);
  ulong gsl_rng_uniform_int(const gsl_rng* r, ulong n);

  version (HAVE_INLINE)
  {

    ulong gsl_rng_get(const gsl_rng* r)
    {
      return r.type.get(r.state);
    }

    double gsl_rng_uniform(const gsl_rng* r)
    {
      return r.type.get_double(r.state);
    }

    double gsl_rng_uniform_pos(const gsl_rng* r)
    {
      double x;
      do
      {
        x = r.type.get_double(r.state);
      }
      while (x == 0);

      return x;
    }

    /* Note: to avoid integer overflow in (range+1) we work with scale =
       range/n = (max-min)/n rather than scale=(max-min+1)/n, this reduces
       efficiency slightly but avoids having to check for the out of range
       value.  Note that range is typically O(2^32) so the addition of 1
       is negligible in most usage. */

    ulong gsl_rng_uniform_int(const gsl_rng* r, ulong n)
    {
      ulong offset = r.type.min;
      ulong range = r.type.max - offset;
      ulong scale;
      ulong k;

      if (n > range || n == 0)
      {
        GSL_ERROR_VAL("invalid n, either 0 or exceeds maximum value of generator",
          GSL_EINVAL, 0);
      }

      scale = range / n;

      do
      {
        k = ((r.type.get(r.state)) - offset) / scale;
      }
      while (k >= n);

      return k;
    }
  }
}

@Name("RngTestBaseOnGSLExample")
unittest
{
  // This unittest is base on GSL example from here https://www.gnu.org/software/gsl/manual/html_node/Random-Number-Generator-Examples.html
  import std.algorithm : equal;
  import std.math : approxEqual;

  enum n = 10;
  double[n] from_gsl_example = [
    0.99974, 0.16291, 0.28262, 0.94720, 0.23166, 0.48497, 0.95748, 0.74431, 0.54004,
    0.73995
  ];
  double[n] d_result;

  gsl_rng_env_setup();

  auto gen_type = gsl_rng_default;
  assert(gen_type !is null);
  auto gen = gsl_rng_alloc(gen_type);
  scope (exit)
    gsl_rng_free(gen);

  foreach (ref e; d_result)
  {
    e = gsl_rng_uniform(gen);
  }

  assert(equal!approxEqual(from_gsl_example[], d_result[]));
}

@Name("RngTestAvailableGenerators")
unittest
{
  // This unittest shows the list of available random generators
  import std.stdio;
  import std.conv : to;

  gsl_rng_type** t, t0;
  t0 = gsl_rng_types_setup();
  writeln("Available generators:");
  for (t = t0; *t !is null; t++)
  {
    writeln((*t).name.to!string);
  }
  writeln("total: ", t - t0);
  assert(t - t0);

  gsl_rng_env_setup();
  auto T = gsl_rng_default;
  assert(T !is null);
  auto r = gsl_rng_alloc(T);
  assert(r !is null);
  scope (exit)
    gsl_rng_free(r);
}
