# Calling function --------------------------------------------------------
source("plot_theme.R")


# Example usage ---------------------------------------------------

#1. Without theme
plot1 <- ggplot(data = mtcars, aes(x = disp, y = mpg)) + 
  geom_point(aes(colour = cyl), size = 2) +
  labs(title = "Displacement vs. MPG", x = "Displacement (cc)", y = "Miles per Gallon") +
  scale_colour_continuous(name = "Cylinders")
plot1

#1.1 with theme
plot1.1 <- ggplot(data = mtcars, aes(x = disp, y = mpg)) + 
  geom_point(aes(colour = cyl), size = 2) +
  labs(title = "Displacement vs. MPG", x = "Displacement (cc)", y = "Miles per Gallon") +
  scale_colour_continuous(name = "Cylinders")+
  plot_theme

plot1.1


#2. adding smooth
plot2<-plot1.1 + geom_smooth(method = "lm", se = FALSE, 
                       color = "darkgrey", linewidth = 0.75)+
  plot_theme

plot2


#3. adding color
plot3<- ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy,color = class),size=2.4)+
  labs(x="Engine size (liters)",y="MPG (Highway)",color="Type of car")+
  theme_bw()+
  scale_y_continuous(breaks = seq(5, 45, by = 5))+
  plot_theme

plot3

#4. Bar plot example

plot4<-ggplot(mtcars, aes(x=as.factor(cyl) )) + 
  geom_bar() + 
  labs(title = "Count of Cars By Cylinders Type", x = "Number of Cylinders", y = "Count")+
  plot_theme

plot4
