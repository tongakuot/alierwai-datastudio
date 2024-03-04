# Clagary Crime Data Plotting Functions ----
box::use(
	ggplot2[...],
	ggtext[...]
)

#' @export
#' 
plot_calgary_crime_data <- function(data,
                                    x_var,
                                    y_var,
                                    max_var,
                                    step_var,
                                    fill_var,
                                    title,
                                    xaxis_title,
                                    yaxis_title,
                                    fill_text) {
  data |>
    ggplot(
      aes({{ x_var }}, {{ y_var }}, fill = {{ fill_var }})
    ) +
    geom_col(position = position_dodge()) +
    theme_classic() +
    scale_x_continuous(
      labels = scales::label_number(scale = 1e-3, suffix = "K"),
      limits = c(0, max_var),
      expand = c(0.02, 0.02),
      breaks = seq(0, max_var, by = step_var)
    ) +
    theme(
      plot.title = element_textbox_simple(
        size = 20,
        margin = margin(b = 5)
      ),
      plot.title.position = "plot",
      axis.text.y = element_text(size = 12),
      legend.position = "top",
      legend.justification = "left",
      plot.margin = unit(c(15, 15, 25, 15), "points")
    ) +
    labs(
      title = title,
      x = xaxis_title,
      y = yaxis_title,
      fill = fill_text
    )
}
