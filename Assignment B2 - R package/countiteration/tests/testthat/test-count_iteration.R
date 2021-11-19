test_that("counting_iteration function", {
  expect_equal(
    as.character(rlang::get_expr(counting_iteration(palmerpenguins::penguins,
                                                    species)$mapping$y)), c("$", ".data", "n"))
  #this expect_equal function compares one element of the counting_iteration function (here the name of the y axis) with the expected value for this element.
  #to pass this test, the element of the function has to be equal, identical to the expected value (here the name of the y axis has to be c("$", ".data", "n"))
  expect_equal(
    as.character(rlang::get_expr(counting_iteration(palmerpenguins::penguins,
                                                    species)$mapping$x)), "species")
  #this expect_equal function compares one element of the counting_iteration function (here the name of the x axis) with the expected value for this element.
  #to pass this test, the element of the function has to be equal, identical to the expected value (here the name of the x axis has to be "species")
  expect_error(counting_iteration(gapminder::gapminder, year))
  #this expect_error function takes the counting_iteration function with the gapminder tibble as entry and the year variable, and look if the result is an error.
  #if it is the case, the test is passed
  expect_true(
    "GeomCol" %in% class(counting_iteration(palmerpenguins::penguins, species)$layers[[1]]$geom))
  #this expect_error function takes the counting_iteration function with the penguins tibble as entry and the species variable, and look at the class of the result.
  #if this class is a GeomCol, the test is passed
})
