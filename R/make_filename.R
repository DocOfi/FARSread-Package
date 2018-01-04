#' Create a file name
#'
#' \code{make_filename} is a wrapper for the function sprintf that returns a character
#'   vector containing a combination of text and the year the data was observed in
#'   csv.bz2 format.
#'
#' @param year A numerical vector indicating the year to include in the name of
#'  the file to be created.
#'
#' @return A character vector indicating the name of the file.
#'
#' @examples
#' make_filename(1988) ### returns "accident_1988.csv.bz2"
#' \dontrun{make_filename("Nineteen ninety two")} ### results in error year has to
#'   ### be numeric or an integer
#'
make_filename <- function(year) {
        year <- as.integer(year)
        sprintf("accident_%d.csv.bz2", year)
}
