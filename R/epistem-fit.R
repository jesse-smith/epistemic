#' Fit a `epistem`
#'
#' `epistem()` fits a model.
#'
#' @param x Depending on the context:
#'
#'   * A __data frame__ of predictors.
#'   * A __matrix__ of predictors.
#'   * A __recipe__ specifying a set of preprocessing steps
#'     created from [recipes::recipe()].
#'
#' @param y When `x` is a __data frame__ or __matrix__, `y` is the outcome
#' specified as:
#'
#'   * A __data frame__ with 1 numeric column.
#'   * A __matrix__ with 1 numeric column.
#'   * A numeric __vector__.
#'
#' @param data When a __recipe__ or __formula__ is used, `data` is specified as:
#'
#'   * A __data frame__ containing both the predictors and the outcome.
#'
#' @param formula A formula specifying the outcome terms on the left-hand side,
#' and the predictor terms on the right-hand side.
#'
#' @param ... Not currently used, but required for extensibility.
#'
#' @return
#'
#' A `epistem` object.
#'
#' @examples
#' predictors <- mtcars[, -1]
#' outcome <- mtcars[, 1]
#'
#' # XY interface
#' mod <- epistem(predictors, outcome)
#'
#' # Formula interface
#' mod2 <- epistem(mpg ~ ., mtcars)
#'
#' # Recipes interface
#' library(recipes)
#' rec <- recipe(mpg ~ ., mtcars)
#' rec <- step_log(rec, disp)
#' mod3 <- epistem(rec, mtcars)
#'
#' @export
epistem <- function(x, ...) {
  UseMethod("epistem")
}

#' @export
#' @rdname epistem
epistem.default <- function(x, ...) {
  stop("`epistem()` is not defined for a '", class(x)[1], "'.", call. = FALSE)
}

# XY method - data frame

#' @export
#' @rdname epistem
epistem.data.frame <- function(x, y, ...) {
  processed <- hardhat::mold(x, y)
  epistem_bridge(processed, ...)
}

# XY method - matrix

#' @export
#' @rdname epistem
epistem.matrix <- function(x, y, ...) {
  processed <- hardhat::mold(x, y)
  epistem_bridge(processed, ...)
}

# Formula method

#' @export
#' @rdname epistem
epistem.formula <- function(formula, data, ...) {
  processed <- hardhat::mold(formula, data)
  epistem_bridge(processed, ...)
}

# Recipe method

#' @export
#' @rdname epistem
epistem.recipe <- function(x, data, ...) {
  processed <- hardhat::mold(x, data)
  epistem_bridge(processed, ...)
}

# ------------------------------------------------------------------------------
# Bridge

epistem_bridge <- function(processed, ...) {
  predictors <- processed$predictors
  outcome <- processed$outcomes[[1]]

  fit <- epistem_impl(predictors, outcome)

  new_epistem(
    coefs = fit$coefs,
    blueprint = processed$blueprint
  )
}


# ------------------------------------------------------------------------------
# Implementation

epistem_impl <- function(predictors, outcome) {
  list(coefs = 1)
}
