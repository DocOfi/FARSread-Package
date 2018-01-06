#' Reading a .csv  or .csv.bz2 file into R
#'
#' \code{fars_read} This function is a wrapper fro the read_csv function in
#'   the package readr. It reads in a single csv file into R for analysis. For
#'   this to work the file should be a .csv or a .csv.bz2 file located in the same
#'   directory as the working directory and the package readr and dplyr should be
#'   installed.
#'
#' @param filename A chararcter string denoting the .csv or .csv.bz2 file to be read into R.
#'
#' @importFrom readr read_csv
#'
#' @importFrom dplyr tbl_df
#'
#' @return an R object of class "tbl_df", "tbl", "data.frame".
#'
#' @examples
#' \donttest{fars_read("accident_2013.csv")}
#' \donttest{fars_read("accident_2014.csv")}
#' \donttest{fars_read("accident_2015.csv")}
#'
#' @export
fars_read <- function(filename) {
        if(!file.exists(filename))
                stop("file '", filename, "' does not exist")
        data <- suppressMessages({
                readr::read_csv(filename, progress = FALSE)
        })
        dplyr::tbl_df(data)
}
