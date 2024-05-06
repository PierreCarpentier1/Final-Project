rm(list=ls())
library(tidyverse)
library(polite)
library(rvest)
library(ggplot2)
library(readxl)
install.packages("gridExtra")
library(gridExtra)
install.packages("patchwork")
library(patchwork)

#Let's import our first dataset on the Emission by sector for France and the EU27
Sector_Emissions <- read_excel("~/Final Project/(Chart) Emissions by sector (1).xlsx", 
                                             sheet = "Arranged version ", col_types = c("text", 
                                                                                        "numeric", "text", "numeric"))
View(Sector_Emissions)

#We divide every value in emissions by 1000 in order to make it easier to read the following graphs VERY IMPORTANT TO ONLY DO IT ONCE
Sector_Emissions$Emissions <- Sector_Emissions$Emissions / 1000

#We know start extracting specific sets of sectors/country here we isolate the aviation and fuel combustion sectors
aviation_data <- filter(Sector_Emissions, grepl("Aviation", Sector_Emissions$Sector))

print(combustion_data)

combustion_data <- filter(Sector_Emissions, grepl("Combustion", Sector_Emissions$Sector))

print(aviation_data)

#Here is a first look at a graph for the Emissions of the Aviation Sector in France in order to not create a number of subset groups too high we can just use the fonction data= subset(dataset,specified value)

Emissions_Plot_Aviation_France <- ggplot(data = subset(aviation_data, Countries == "FRANCE"), 
                         aes(x = Year, y = Emissions)) + 
  geom_line(color = "red") + 
  labs(title = "Plot of Emissions for the aviation Sector for France", x = "Year", y = "Emissions in 100 tons of CO2 equivalent")
print(Emissions_Plot_Aviation_France)

#We can obviously do the same for the EU27 

Emissions_Plot_Aviation_EU27 <- ggplot(data = subset(aviation_data, Countries == "EU27"), 
                         aes(x = Year, y = Emissions)) + 
  geom_line(color = "blue") + 
  labs(title = "Plot of Emissions for the aviation sector for the EU27", x = "Year", y = "Emissions in 100 tons of CO2 equivalent")
print(Emissions_Plot_Aviation_EU27)

#We can directly combine them into one graph 
Emissions_Plot_Aviation <- ggplot() +
  geom_line(data = subset(aviation_data, Countries == "EU27"), aes(x = Year, y = Emissions), color = "blue") +
  geom_line(data = subset(aviation_data, Countries == "FRANCE"), aes(x = Year, y = Emissions), color = "red") + 
  labs(title = "Plot of Emissions for the Aviation Sector", x = "Year", y = "Emissions in 100 tons of CO2 equivalent")

print(Emissions_Plot_Aviation)

# Now that we've seen most of the coding related to this we can just apply it to different settings in order 
# to show different things let's look into emissions from all sectors : 


Emissions_Plot_All_Sectors_EU27 <- ggplot(data = subset(Sector_Emissions, Countries == "EU27"),
                                          aes(x = Year, y = Emissions, color = Sector)) +
  geom_line() +
  labs(title = "Emissions by Sector in EU27", x = "Year", y = "Emissions") +
  scale_color_manual(values = c("blue", "red", "green", "purple"))

print(Emissions_Plot_All_Sectors_EU27)

#We can use the same colors and create the same graph for France and then set them next to the other : 

Emissions_Plot_All_Sectors_France <- ggplot(data = subset(Sector_Emissions, Countries == "FRANCE"), aes(x = Year, y = Emissions, color = Sector)) +
  geom_line() +
  labs(title = "Emissions by Sector in France", x = "Year", y = "Emissions") +
  scale_color_manual(values = c("blue", "red", "green", "purple"))

print(Emissions_Plot_All_Sectors_France)

#With the function combined_plot we can put them next to the other you should probably increase the size of the plots box to see them both

combined_plot <- Emissions_Plot_All_Sectors_France + Emissions_Plot_All_Sectors_EU27
combined_plot


