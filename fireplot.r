############################
#  "FIRE" PLOT
############################

library(ggplot2)
library(dplyr)

# We are trying to recreate this: https://vsueiro.com/data-stories/all-the-government-barbecues/en/

# We'll use diamonds dataset instead
diam <- sample_n(diamonds,2500)

# Colors
low_yellow <- "#F9CE19"
mid_orange <- "#F47C2A"	 
high_red   <- "#EF3733"
background_color <- "#3F2737"
font_color <- "#99766E"

p <- ggplot(diam, aes(x=cut, y=price)) + 
	 geom_point(aes(color=price),position=position_jitter(width=0.15), alpha=0.3, shape=16, size=3) +
	scale_color_gradientn(colors=c(low_yellow, mid_orange, high_red), values=c(0,0.05,0.15, 1), guide="none")	

# Modify theme
fireplot <- p + theme_minimal() + 
    theme(plot.background = element_rect(fill=background_color),
		 panel.grid.major = element_blank(),
		 panel.grid.minor = element_blank(),
		 axis.title = element_blank(),
		 axis.text =element_text(color=font_color, size=8),
		 panel.grid.major.y = element_line(color=alpha("black",0.1)))
	
print(fireplot)