********************************************************************************
*** Demo File of the Package Parallel
********************************************************************************

// 09/2018 Senan Hogan-Hennessy
// This file demonstrates the package parallel, which parallelises at the level of a loop.
// https://github.com/gvegayon/parallel/

clear all
set more off, permanently
set seed 47
set obs 100

// Demonstrate serial code that is to be parallelised
// generate 4 variables, each with value of 1 for 100 observations 

local list "x1 x2 x3 x4"

foreach variable of local list {
	gen `variable' = 1
}

// Parallel package dependencies
net install parallel, from(https://raw.github.com/gvegayon/parallel/master/) replace
mata mata mlib index
parallel setclusters 4, f

// Define program that will be run in parallel
prog def parfor

local list "x1 x2 x3 x4"

foreach variable of local list {
	replace `variable' = 2
}

end //Finish defining programme

parallel, prog(parfor): parfor y_pll   // Call the  programme

// The Programme starts 4 (number of cores defined) simultaneous do files
// that are run the code at the level of the loop.
// Here, those files replace the values for given variables.

// For further reading the package documentation describes how this package parallelises other things,
// such as simulations and use in MCMC sampling, though parallelising at the loop level is most useful.
