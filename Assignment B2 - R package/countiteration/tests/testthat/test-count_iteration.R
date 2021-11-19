test_that("counting_iteration function", {
  expect_equal(
    as.character(rlang::get_expr(counting_iteration(palmerpenguins::penguins,
                                                    species)$mapping$y)), "n") #checking the name of the y axis
  expect_equal(
    as.character(rlang::get_expr(counting_iteration(palmerpenguins::penguins,
                                                    species)$mapping$x)), "species") #checking the name of the y axis
  expect_error(counting_iteration(gapminder::gapminder, year)) #the function does not work with a variable containing numerical value
  expect_true(
    "GeomCol" %in% class(counting_iteration(palmerpenguins::penguins, species)$layers[[1]]$geom)) #the class of the plot should be GeomCol
})
