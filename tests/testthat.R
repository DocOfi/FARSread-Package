library(testthat)
library(FARSread)

test_check("FARSread")
expect_that(dim(fars_summarize_years(2015))[1], is_equivalent_to(12))
throws_error(fars_map_state(0, 2013))
throws_error(fars_map_state(3, 2013))
throws_error(fars_map_state(7, 2013))
throws_error(fars_map_state(14, 2013))
throws_error(fars_map_state(57, 2013))




