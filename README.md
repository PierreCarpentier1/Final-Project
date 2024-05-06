# Final-Project
Here is my submission to the Final Project for the R for Economics course. My project consists of an analysis of the Emissions trading systems. I use two different systems : the European Union Emissions Trading System (EU ETS) and the Western Climate Initiative. It is seprated in different parts : The first part being mostly about data sorting in order to have a clear, usable data set. The second part is mostly about showing the data through the construction of graphs. In the last part, I ran a few regressions but it is important to note that their statistical relevance is practically non existent.

# How to use it
This project is mainly consisting of multiple databases, I have sepcified at the beginning every packet you might need to make this work however, you may need to change the directory of each file as they may not be adjusted to where the file is. To do so, just open up the location on the dataset file on your computer then copy the path to that document and change it in the argument. For example on the first file : 
read_excel("~/Final Project/(Chart) Emissions by sector (1).xlsx", 
                                             sheet = "Arranged version ", col_types = c("text", 
                                                                                        "numeric", "text", "numeric"))
here, just change  ""~/Final Project/(Chart) Emissions by sector (1).xlsx" to whatever location you've put the file in and specify the correct name for the file.
