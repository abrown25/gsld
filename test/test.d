import gsld.block.gsl_block_double;
import gsld.matrix.gsl_matrix_double;
import gsld.vector.gsl_vector_double;
import gsld.multifit.gsl_multifit;

import unit_threaded.runner;

int main(string[] args)
{
	return args.runTests!(
        gsld.block.gsl_block_double,
        gsld.matrix.gsl_matrix_double,
        gsld.vector.gsl_vector_double,
        gsld.multifit.gsl_multifit,
	gsld.cdf.gsl_cdf
    );
}
