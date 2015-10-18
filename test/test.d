import gsl.block_double;
import gsl.matrix_double;
import gsl.vector_double;
import gsl.multifit;
import gsl.cdf;
import gsl.rng;

import unit_threaded.runner;

int main(string[] args)
{
	return args.runTests!(
		gsl.block_double,
		gsl.matrix_double,
		gsl.vector_double,
		gsl.multifit,
		gsl.cdf,
		gsl.rng,
	);
}
