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

#5. Graphical interpretation of lms with plot_theme

#Creating model 1
model1 <- lm(sleep_rem ~ bodywt + brainwt, data = msleep)

#Tidying model 1
model1_tidy<-broom::tidy(model1, se = 'standard', conf.int = TRUE,conf.level = 0.95) %>% 
  mutate(model = "Model 1")

#Creating model 2 for comparison (adding in sleep_total)
model2 <- lm(formula = sleep_rem ~ bodywt + brainwt + sleep_total, data = msleep)

#Tidying model 2
model2_tidy<-broom::tidy(model2, se = 'standard', conf.int = TRUE,conf.level = 0.95) %>% 
  mutate(model = "Model 2")

#Combine results into a single dataframe
sleep_results <- bind_rows(model1_tidy, model2_tidy) %>% 
  filter(term!="(Intercept)")

#Plotting
sleep_results_plot <- ggplot(data=sleep_results, aes(x=term, y=estimate, 
                                                     color = model, shape = model)) + 
  geom_hline(yintercept=0, color="red", size=.5) +
  geom_errorbar(aes(ymin=conf.low, ymax=conf.high, width=0), linewidth=.5, position=position_dodge(width=0.5)) +
  geom_point(aes(y=estimate), size=1.75, position = position_dodge(width=0.5)) +
  labs(title = "Model Estimates of Brain and Body Weight (and total sleep) on REM Sleep (hrs) in Mammals",
       x = "Predictor",
       y = "Coefficient Estimate",
       caption = "Models fit with OLS. Error bars show the 95% confidence interval.",
       color = "Model:",
       shape = "Model:") +
  scale_x_discrete(labels = c("Body Weight (kg)", "Brain Weight (kg)", "Total Sleep (hrs)"))+ 
  coord_flip()+
  geom_text(aes(y=estimate,label=round(estimate, digits=3)), size=4.5, vjust=-0.5, position = position_dodge(width=0.5),show.legend=F)+
  plot_theme

sleep_results_plot
