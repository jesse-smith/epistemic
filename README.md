
<!-- README.md is generated from README.Rmd. Please edit that file -->

# epistemic

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/epistemic)](https://CRAN.R-project.org/package=epistemic)
[![Codecov test
coverage](https://codecov.io/gh/jesse-smith/epistemic/branch/master/graph/badge.svg)](https://codecov.io/gh/jesse-smith/epistemic?branch=master)
[![R build
status](https://github.com/jesse-smith/epistemic/workflows/R-CMD-check/badge.svg)](https://github.com/jesse-smith/epistemic/actions)
<!-- badges: end -->

The goal of epistemic is to make epidemic modeling and inference
accessible in a tidy manner. The interface and code conform to
tidymodels conventions; the underlying implementation is access via the
epidemia package from the team at Imperial College London.

## Installation

epistemic uses compiled C++ models from Stan, which means you’ll need to
make sure your C++ toolchain is configured correctly (you’d need it
anyway to install the development version via devtools). See
[here](https://github.com/stan-dev/rstan/wiki/RStan-Getting-Started) for
help.

You can install the development version of epistemic from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("devtools")
devtools::install_github("jesse-smith/epistemic")
```

## Code of Conduct

Please note that the epistemic project is released with a [Contributor
Code of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
