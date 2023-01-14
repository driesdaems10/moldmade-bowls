rm(list=ls())
library(ggplot2)

setwd("C:/Users/daems/OneDrive/Work/Research/ABM/Pottery model/model")
data = readxl::read_excel("moldmade-bowls-data_v1_2.xlsx", sheet = "Sheet1", skip = 0)

# keeps variables with information for the slicing
vars = c("ID", "date", "count", "type") 
data_selection = data[,c(colnames(data) %in% vars)]

data_selection2 = data_selection[data_selection$count < 100,]

#data-viz
ggplot(data = data_selection2) +
  aes(x = date, y = count, color = factor(type)) +
  geom_point() +
  geom_smooth() +
 # facet_wrap(~type) +
  labs(x = "Date",
       y = 'Count') +
  theme(legend.position = c(0.8, 0.8),
        legend.direction = "vertical",
        legend.text=element_text(size = 16, face = "italic"),
        legend.title = element_blank(),
        legend.background = element_blank(),
        legend.box.background = element_rect(colour = "grey10"),
        legend.key.width = unit(2.2,"cm"),
        panel.background = element_rect(fill = "white",
                                        colour = "white",
                                        size = 0.5, linetype = "solid"),
        panel.grid.major = element_line(size = 0.5, linetype = 'solid',
                                        colour = "grey80"), 
        panel.grid.minor = element_line(size = 0.25, linetype = 'solid',
                                        colour = "grey80"),
        axis.text.x = element_text(color = "grey10", size = 16, face = "plain"),
        axis.text.y = element_text(color = "grey10", size = 16, face = "plain"),  
        axis.title.x = element_text(color = "grey10", size = 20, face = "italic"),
        axis.title.y = element_text(color = "grey10", size = 20, face = "italic"),
        strip.text.x = element_text(size = 18)
        ) # + 
  scale_colour_manual(values = c("grey70", "black"))
ggsave("figure1.jpg", width = 24, height = 10, units = c("cm"), dpi = 300)
