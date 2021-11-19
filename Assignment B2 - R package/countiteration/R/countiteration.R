#' @title Counting iteration
#'
#' @description This function count the number of iteration for the different possibilities of one variable of a table
#'
#' @param data is a table
#' @param x is the name of the variable for which we want to count the number of iteration for the different possibilities
#' @return a plot of columns in the decreasing order, showing the counts for every possibilities of the variable of interest
#' @examples
#' counting_iteration(palmerpenguins::penguins, species)
#' counting_iteration(dplyr::starwars, homeworld)
#'
#' @importFrom rlang :=
#' @importFrom rlang .data
#' @export

counting_iteration <- function (data, x) {
  data%>%
    dplyr::group_by({{x}})%>%
    dplyr::summarise(n=dplyr::n())%>%
    tidyr::drop_na()%>%
    dplyr::mutate({{x}} := forcats::fct_reorder({{x}}, .data$n))%>%
    ggplot2::ggplot(ggplot2::aes({{x}}, .data$n))+
    ggplot2::geom_col()+
    ggplot2::coord_flip()
}
