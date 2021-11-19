#' @title Counting iteration
#'
#' @description This function count the number of iteration for the different possibilities of one variable of a table
#'
#' @param data is a dataframe or a tibble
#' @param x is the name of the variable for which we want to count the number of iteration for the different possibilities
#' @return a histogram in the decreasing order, showing the counts for every possibility of the variable of interest
#' @examples
#' counting_iteration(palmerpenguins::penguins, species)
#' counting_iteration(dplyr::starwars, homeworld)
#'
#' @importFrom rlang :=
#' @importFrom rlang .data
#' @export

counting_iteration <- function (data, x) { #take in entry a dataframe or a tibble and the name of a variable
  data%>%
    dplyr::group_by({{x}})%>% #group the dataframe or the tibble by the variable selected
    dplyr::summarise(n=dplyr::n())%>% #count the number of iteration for each possibility of the variable selected
    tidyr::drop_na()%>% #drop the count of NA
    dplyr::mutate({{x}} := forcats::fct_reorder({{x}}, .data$n))%>% #reorder the dataframe or tibble in the decreasing order
    ggplot2::ggplot(ggplot2::aes({{x}}, .data$n))+ #create a plot with the variable in the x axis (every possibilities) and the number of iteration for each possibility in the y-axis
    ggplot2::geom_col()+ #create an histogram (in the decreasing order with the reordering)
    ggplot2::coord_flip() #flip the coordinates, to have the possibilities on the y-axis and the count on the x-axis for visibility purpose
}
