############################
#  DUMBBELL PLOT
############################

library(ggplot2)
library(forcats)

# Let's fix the "Bush" rows
pres <- presidential
pres[8,]$name <- "Bush Sr."
pres[10,]$name <- "Bush Jr."

# Reorder presidents by start time
pres$name <- fct_reorder(pres$name, pres$start, .desc=T)

# Named vector for the colors
presidential.colors <- c("Republican"="firebrick3", "Democratic"="dodgerblue3")

# The actual plot
dumbbell <- ggplot(pres, aes(y=name, color=party)) +
	geom_segment(aes(x=start, xend=end, y=name, yend=name)) +
	geom_point(aes(x=start)) +
	geom_point(aes(x=end)) +
  	geom_text(aes(label=name,x=start), hjust=0, size=3, nudge_y=0.3, family="PT Sans") +
	scale_color_manual(values=presidential.colors, guide="none")	+
	scale_x_date(date_breaks="4 years", date_labels="%Y") +
	labs(title="Presidents of the United States of America 1953-2017") +
	theme_minimal(base_family="PT Sans") + 
	theme(axis.text.y = element_blank(),
		  axis.title.y = element_blank(),
		  axis.title.x = element_blank(),
		  panel.grid.minor = element_blank(),
		  panel.grid.major.y = element_blank(),
		  panel.grid.major.x = element_line(size=0.25))
		  
print(dumbbell)