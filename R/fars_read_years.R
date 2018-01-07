#' Creates a list of dataframe showing the variables MONTH and year in the data
#'
#' \code{fars_read_years} takes a numerical vector representing which years in the
#'   data should be included in the data frame output. For this function to work,
#'   data should be in .csv.bz2 format located in the same directory as the working
#'   directory. In case the data for a particular year is unavailable, the function
#'   will show a warning and return null for the year that was not available.
#'
#' @param years A numerical vector indicating which years to search for in the data.
#'
#' @details If you have a file from FARS that is in .csv format but not in .csv.bz2
#'   format, you can convert it to .csv.bz2 format by using the write.csv function
#'   in R.
#'
#' @seealso \code{\link{make_filename}}
#'
#' @seealso \code{\link{fars_read_years}}
#'
#' @importFrom readr read_csv
#'
#' @importFrom magrittr %>%
#'
#' @importFrom dplyr tbl_df
#'
#' @importFrom magrittr %>%
#'
#' @importFrom dplyr mutate
#'
#' @importFrom dplyr select
#'
#' @return A list of data frames for each year that was requested. The data frame
#'  will have the variables MONTH and year. Each row will contain a single case or
#'  observation that was recorded for a particular month of that year.
#'
fars_read_years <- function(years) {
        MONTH <- NULL
        lapply(years, function(year) {
                file <- make_filename(year)
                tryCatch({
                        dat <- fars_read(file)
                        dplyr::mutate(dat, year = year) %>%
                                dplyr::select(MONTH, year)
                }, error = function(e) {
                        warning("invalid year: ", year)
                        return(NULL)
                })
        })
}
