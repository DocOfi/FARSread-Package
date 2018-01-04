#'Creates a data frame that contains number of records available per month
#'
#' \code{fars_summarize_years} takes a numerical vector representing the years in
#'   the data  that should be included in the data frame output. For this function
#'   to work, data should be in .csv.bz2 format located in the same directory as
#'   the working directory. In case the data for a particular year is unavailable,
#'   the function will show an error message for the year that was not available.
#'
#' @details If you have a file from FARS that is in .csv format but not in .csv.bz2
#'   format, you can convert it to .csv.bz2 format by using the write.csv function
#'   in R. See vignette "Other functions in readFARS".
#'
#' @param years A  numerical vector indicating which years to search for in the data.
#'
#' @inheritParams fars_read_years
#'
#' @seealso \code{\link{make_filename}}
#'
#' @seealso \code{\link{fars_read_years}}
#'
#' @importFrom readr read_csv
#'
#' @importFrom dplyr tbl_df
#'
#' @importFrom magrittr %>%
#'
#' @importFrom dplyr mutate
#'
#' @importFrom dplyr select
#'
#' @importFrom dplyr bind_rows
#'
#' @importFrom dplyr group_by
#'
#' @importFrom dplyr summarize
#'
#' @importFrom tidyr spread
#'
#' @return A data frame with the variables MONTH and each year where data is
#'   avaiable, summarizing the number of observations recorded each month per year.
#'
#' @examples
#' \dontrun{fars_summarize_years((c(2013, 2014, 2015)))} ### returns a data frame
#'   ### containing the variables MONTH and year that data is available.
#' \dontrun{fars_summarize_years(c(2013, 2014, "nineteen ninety two"))} ### returns a list
#'   ### of data frames containing the variable MONTH and year for the year 2013 and 2014
#'   ### and an error indicating that "nineteen ninety two" is an invalid request.
#'
#' @export
fars_summarize_years <- function(years) {
        dat_list <- fars_read_years(years)
        dplyr::bind_rows(dat_list) %>%
                dplyr::group_by(year, MONTH) %>%
                dplyr::summarize(n = n()) %>%
                tidyr::spread(year, n)
}
