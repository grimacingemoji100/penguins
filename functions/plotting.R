#plots body mass against flipper length, with regression line overlaid

plot_regression <- function(penguins_regression){
  penguins_regression %>% 
    ggplot(aes(x = body_mass_g, y = flipper_length_mm)) +
    geom_point(aes(color = species), size = 1.5, show.legend = TRUE) +
    scale_color_manual(values = c("#b2df8a","#1f78b4","#a6cee3")) +
    labs(x = "Body mass (g)",
         y = "Flipper length (mm)") +
    theme_bw() +
    stat_smooth(method='lm', color = 'red') + #overlay linear model
    labs(colour = "Species")
}

#saves as png

save_plot_png <- function(penguins_regression, 
                                  filename, size, res, scaling){
  agg_png(filename, width   =  size, 
          height  =  size, 
          units   =  "cm", 
          res     =  res, 
          scaling =  scaling)
  plot_regression <- plot_regression(penguins_regression)
  print(plot_regression)
  dev.off()
}

#saves as vector

save_plot_svg <- function(penguins_regression, 
                                  filename, size, scaling){
  size_inches = size/2.54
  svglite(filename, width   = size_inches, 
          height  = size_inches, 
          scaling = scaling)
  plot_regression <- plot_regression(penguins_regression)
  print(plot_regression)
  dev.off()
}