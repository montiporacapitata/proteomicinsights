
library(tidyverse)
library(ggplot2)
library(ggsignif)
library(lmerTest)
library(emmeans)
library(sjPlot)
library(drc)
library(Rmisc)
library(viridis)
library(ggplot2)
library(RColorBrewer)
library(cowplot)


#Files and variables
setwd("E:/PhD_Organized/I. Science/B. Physiology and CBASS/3. CBASS/2. data_FvFm")
#### Read in pam data ###

data_raw <- read.csv("CBASS_long_data_final_ok.csv", sep =";")
data_raw
data <- subset(data_raw, day == "Pre-CBASS" & run == "AL")
### Set correct factors etc. ####

data$Treatment <- as.factor(data$Treatment)
data$FvFm <- as.numeric(as.character(data$FvFm))

data <- data %>% filter(genotype!="G58") %>% filter(genotype!="G62") %>% filter(genotype!="G92") 

myboxplot <- ggplot(data, aes(y = FvFm, x = Treatment, fill = Treatment)) +
  geom_boxplot()+
  geom_jitter(alpha = .3)+
  scale_fill_manual(values = c("goldenrod", "midnightblue"))+
  theme_cowplot(10)+
  theme(legend.position = "none")+
  ylab("Fv/Fm")
myboxplot

plot_grid(myboxplot, myboxplot)
