############################
#  LOLLIPOP PLOT
############################

# Make sure you have downloaded election2019.csv and put it to your working directory
# setwd("Path/to/your/folder")
library(ggplot2)
library(forcats)

theme_set(theme_minimal())
# Read dataset
election <- read.csv("election2019.csv", stringsAsFactors=T)
# Sort dataset
election$CANDIDATES.2019 <- fct_reorder(election$CANDIDATES.2019, election$SEATS.2019)
# Choose your color here
mycolor="#3C3B53"
# The actual plot
lollipop <- ggplot(election, aes(y=CANDIDATES.2019, x=SEATS.2019)) + 
	geom_segment(aes(x=0 ,xend=SEATS.2019, y=CANDIDATES.2019, yend=CANDIDATES.2019), color=mycolor, size=1) +
	geom_point(size=6, color=mycolor) +
	geom_text(aes(label=SEATS.2019), color="white", size=3) +
	scale_y_discrete(name="") +
	scale_x_continuous(name="Number of seats obtained", position="top") +
	labs(title="Results of the 2019 election", caption="Source of the data") +
	theme_minimal(base_family="PT Sans", base_size=9) + 
	theme(panel.grid.minor = element_blank(),
		  panel.grid.major.y = element_blank(),
		  plot.title = element_text(face="bold",size=12, hjust=0.95),
		  axis.text.y = element_text(face="bold")
		  )
		  
print(lollipop)
