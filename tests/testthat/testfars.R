context("tests on inputs")###invalid State numbers

test_that("results in error", {
        throws_error(fars_map_state(0, 2013))
        throws_error(fars_map_state(3, 2013))
        throws_error(fars_map_state(7, 2013))
        throws_error(fars_map_state(14, 2013))
        throws_error(fars_map_state(57, 2013))
        throws_error(fars_map_state(57, "Twenty Thirteen"))
})

context("test on outputs")

test_that("dimensions are correct", {
        fars_2013 <- system.file("extdata", "accident_2013.csv.bz2", package = "FARSread")
        acc_2013 <- fars_read(fars_2013)
        expect_that(acc_2013, is_a("tbl_df"))
        expect_that(nrow(acc_2013), is_more_than(0))
        expect_that(ncol(acc_2013), is_more_than(0))
})
