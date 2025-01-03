# Loading dependency ---------------------------------------------------------

#As the function requires the tidyverse this code chunk checks if the package is installed and if not installs it before loading.
if(!require(tidyverse)){
  install.packages("tidyverse")
  library(tidyverse)
}


# Creating a ggplot theme -------------------------------------------------

plot_theme = theme(text = element_text(size=11),  #set text size to 11
                   panel.grid.minor = element_blank(), #these next two lines set the grid lines to null
                   panel.grid.major = element_blank(),
                   panel.background = element_blank(),#these lines make the background of the plot blank
                   plot.background = element_rect(fill = "transparent",colour = NA),
                   axis.text = element_text(color="black"), #setting axis text to black 
                   axis.line = element_line(colour = "black"),#setting axis lines to black 
                   strip.text.y = element_text(angle = 0), axis.title.y = element_text(angle=90, hjust=.5, vjust=.5),#adjusting the angle of text
                   axis.title = element_text(lineheight=1.1), #increasing height of axis title
                   legend.position = "bottom",  #Placing the legend at the bottom of the figure
                   legend.key = element_rect(colour = "transparent",  fill = "transparent") #setting legend to transparent
) 
