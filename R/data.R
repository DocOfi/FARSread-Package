#' Fatality Analysis Reporting System (FARS) 2015
#'
#' FARS contains data derived from the census of fatal motor vehicle traffic
#'   crashes within the 50 States, the District of Columbia, and Puerto Rico for the
#'   year 2015
#'
#' @format A data frame with 32166 rows and 52 columns:
#' \describe{
#'   \item{STATE}{State number corresponding to a State in the USA}
#'   \item{ST_CASE}{This element identifies the unique case number assigned by the
#'     data entry system}
#'   \item{VE_TOTAL}{This element records all contact motor vehicles which the
#'     officer has reported on the Police Accident Report PAR as a unit involved
#'     in the crash}
#'   \item{VE_FORMS}{This data element is a count of the number of vehicles in-
#'     transport involved in the crash}
#'   \item{PVH_INVL}{Number of Parked orWorking Vehicles Involved}
#'   \item{PEDS}{This element records the number of Persons Not a Motor
#'     Vehicle occupant}
#'   \item{PERNOTMVIT}{This data element is a count of the number of non-motorists
#'     in the crash.}
#'   \item{PERMVIT}{This data element is a count of the number of motorists in the crash}
#'   \item{PERSONS}{This data element is a count of the number of Person Level
#'     Motor Vehicle Occupant}
#'   \item{COUNTY}{This data element records the location of the unstabilized event
#'     with regard to the County.}
#'   \item{CITY}{This data element records the location of the unstabilized event
#'     with regard to the City}
#'   \item{DAY}{This data element records the day of the month on which the crash occurred}
#'   \item{MONTH}{This data element records the month in which the crash occurred}
#'   \item{YEAR}{This data element records the year in which the crash occurred}
#'   \item{DAY_WEEK}{This data element records the day of the week on which the crash occurred}
#'   \item{HOUR}{This data element records the hour at which the crash occurred}
#'   \item{MINUTE}{This data element records the minutes after the hour at which the crash occurred}
#'   \item{NHS}{This data element identifies whether this crash occurred on a
#'     trafficway that is part of the National Highway System}
#'   \item{RUR_URB}{This data element identifies whether this crash occurred on a rural
#'     or urban setting}
#'   \item{FUNC_SYS}{This data element identifies on what type of road this crash occurred}
#'   \item{RD_OWNER}{This data element identifies the ownership of the road}
#'   \item{ROUTE}{This data element identifies the route signing of the trafficway
#'     on which the crash occurred}
#'   \item{TWAY_ID}{This data element records the trafficway on which the crash occurred}
#'   \item{TWAY_ID2}{This data element records the trafficway on which the crash occurred
#'     2004 - later}
#'   \item{MILEPT}{This data element records the milepoint nearest to the location
#'     where the crash}
#'   \item{LATITUDE}{This element identifies the location of the crash using Global
#'     Position coordinates. This is the position of latitude}
#'   \item{LONGITUDE}{This element identifies the location of the crash using Global
#'     Position coordinates. This is the position of longitude}
#'   \item{SP_JUR}{This data element identifies if the location on the trafficway
#'     where the crash occurred qualifies as a Special Jurisdiction even though it
#'     may be patrolled by state, county or local police e.g., all State highways
#'     running through Indian reservations are under the jurisdiction of the Indian
#'     reservation}
#'   \item{HARM_EV}{This data element describes the first injury or damage producing
#'     event of the crash}
#'   \item{MAN_COLL}{This data element describes the orientation of two motor vehicles
#'     in-transport when they are involved in the First Harmful Event of a collision
#'     crash}
#'   \item{REL_JCT1}{This data element identifies the crash's location with respect
#'     to presence in an interchange area}
#'   \item{REL_JCT2}{This data element identifies the crash's location with respect
#'     to presence in or proximity to components typically in junction or interchange
#'     areas}
#'   \item{TYP_INT}{This data element identifies and allows separation of various
#'     intersection types}
#'   \item{WRK_ZONE}{This data element identifies a motor vehicle traffic crash in
#'     which the first harmful event occurs within the boundaries of a work zone or
#'     on an approach to or exit from a work zone, resulting from an activity,
#'     behavior, or control related to the movement of the traffic units through the
#'     work zone}
#'   \item{REL_ROAD}{This data element identifies the location of the crash as it
#'     relates to its position within or outside the trafficway based on the First
#'     Harmful Event}
#'   \item{LGT_COND}{This data element records the lighting condition when the crash
#'     occurred}
#'   \item{WEATHER1}{This data element records the prevailing atmospheric conditions
#'     that existed at the time of the crash as indicated in the case material}
#'   \item{WEATHER2}{This data element records the prevailing atmospheric conditions
#'     that existed at the time of the crash as indicated in the case material If
#'     more than two atmospheric conditions were reported, the two conditions that
#'     most affect visibility were selected}
#'   \item{WEATHER}{This data element records the prevailing atmospheric conditions
#'     that existed at the time of the crash as indicated in the case material.
#'     Accident.WEATHER is derived from the variables WEATHER1 and WEATHER2}
#'   \item{SCH_BUS}{This data element identifies if a school bus, or motor vehicle
#'     functioning as a school bus, is related to the crash}
#'   \item{RAIL}{This data element identifies if the crash occurred in or near a
#'     rail grade crossing}
#'   \item{NOT_HOUR}{This data element records the hour that emergency medical service
#'     was notified}
#'   \item{NOT_MIN}{This data element records the minutes after the hour that
#'     emergency medical service was notified}
#'   \item{ARR_HOUR}{This data element records the minutes after the hour that
#'     emergency medical service arrived on the crash scene}
#'   \item{ARR_MIN}{This data element records the minutes after the hour that
#'     emergency medical service arrived on the crash scene}
#'   \item{HOSP_HR}{This data element records the hour that emergency medical
#'     service arrived at the treatment facility to which it was transporting
#'     victims of the crash}
#'   \item{HOSP_MIN}{This data element records the minutes after the hour that
#'     emergency medical service arrived at the treatment facility to which it was
#'     transporting victims of the crash}
#'   \item{CF1}{This data element records factors related to the crash expressed
#'     by the investigating officer}
#'   \item{CF2}{This data element records factors related to the crash expressed
#'     by the investigating officer, if there are more than one factor}
#'   \item{CF3}{This data element records factors related to the crash expressed
#'     by the investigating officer, if there are more than one factor}
#'   \item{FATALS}{This data element records the number of fatally injured persons
#'   in the crash}
#'   \item{DRUNK_DR}{This data element records the number of drunk drivers involved
#'     in the crash}
#' }
#' @source The 2015 FARS data was obtained from the National Highway Traffic Safety
#'   Administration. \url{https://www.nhtsa.gov/about-nhtsa}
#'
#' @examples
#' \dontrun{
#' head(fars_2015)
#' }
"fars_2015"
