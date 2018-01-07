#' Creates a map plot that shows the location where traffic accidents occurred
#'
#' \code{fars_map_state} takes a numerical vector corresponding to the state whose
#'   data will be plotted and the year when the data occurred. For this function to
#'   work, data should be in .csv.bz2 format located in the same directory as the
#'   working directory. In case the data for a particular year is unavailable, the
#'   function will show an error message for the year that was not available.
#'
#' @note In case the chosen numerical vector does not correspond to a particular
#'   state, the function will stop and show an error message. The numbers 3, 7, 14, and any
#'   number above 56 will result in an error. In case, there are no traffic accidents for that
#'   particular year or state, a message will appear stating there are no accidents to plot.
#'
#' @details If you have a file from FARS that is in .csv format but not in .csv.bz2
#'   format, you can convert it to .csv.bz2 format by using the write.csv function
#'   in R. See vignette "Other functions in readFARS".
#'
#' @param state.num A numerical vector corresponding to a particular state in the USA.
#'
#' @param year A numerical vector corresponding to a particular year.
#'
#' @seealso \code{\link{make_filename}}
#'
#' @seealso \code{\link{fars_read}}
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
#' @importFrom dplyr filter
#'
#' @importFrom maps map
#'
#' @importFrom graphics points
#'
#' @return A plot of the map of the state of interest with points on the map
#' indicating traffics fatalities occurred.
#'
#' @examples
#' \donttest{fars_map_state(2, 2013)}
#' \donttest{fars_map_state(2000, 2013)}
#'
#' @export
fars_map_state <- function(state.num, year) {
        STATE <- NULL
        filename <- make_filename(year)
        data <- fars_read(filename)
        state.num <- as.integer(state.num)

        if(!(state.num %in% unique(data$STATE)))
                stop("invalid STATE number: ", state.num)
        data.sub <- dplyr::filter(data, STATE == state.num)
        if(nrow(data.sub) == 0L) {
                message("no accidents to plot")
                return(invisible(NULL))
        }
        is.na(data.sub$LONGITUD) <- data.sub$LONGITUD > 900
        is.na(data.sub$LATITUDE) <- data.sub$LATITUDE > 90
        with(data.sub, {
                maps::map("state", ylim = range(LATITUDE, na.rm = TRUE),
                          xlim = range(LONGITUD, na.rm = TRUE))
                graphics::points(LONGITUD, LATITUDE, pch = 46)
        })
}
