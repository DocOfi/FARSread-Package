library(FARSread)
###invalid State numbers
test_that("results in error", {
        throws_error(fars_map_state(0, 2013))
        throws_error(fars_map_state(3, 2013))
        throws_error(fars_map_state(7, 2013))
        throws_error(fars_map_state(14, 2013))
        throws_error(fars_map_state(57, 2013))
        throws_error(fars_map_state(57, "Twenty Thirteen"))
})


