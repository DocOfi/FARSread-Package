#' Create a file name
#'
#' \code{make_filename} is a wrapper for the function sprintf that returns a character
#'   vector containing a combination of text and the year the data was observed in
#'   csv.bz2 format.
#'
#' @param year A numerical vector for the year to include in the file name.
#'
#' @return A character vector indicating the name of the file in .csv.bz2 format
#'
make_filename <- function(year) {
        year <- as.integer(year)
        sprintf("accident_%d.csv.bz2", year)
}
