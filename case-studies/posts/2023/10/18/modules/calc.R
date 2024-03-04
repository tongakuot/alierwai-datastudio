# Calgary Crime Data Summarization Function ----

#' @export
#' 
summarize_calgary_crime_data <- function(data, crime_var, group_vars) {
	
	box::use(dplyr[summarize])
	
	data |> 
		summarize(
			crime = sum({{ crime_var }}, na.rm = TRUE),
			.by = {{ group_vars }}
		)
}
