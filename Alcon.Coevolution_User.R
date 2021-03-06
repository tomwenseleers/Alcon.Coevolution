###########################################################
### User script for the Digital_Coevolution simulation ####
###########################################################

## This is the script you should be working with when you
## want to use the Digital_Organism.
## There is a few things that have to be done carefully in
## order for this to work smoothly.
## Simply work through this script line by line and 
## follow the instructions.
## Have fun!

###########################################################
## The simulation relies upon four .R files (one of which
## you are reading right now), which you should all have 
## in the same folder.

# Please type the full path to the folder that contains 
# the .R files, including this one.
source.file.location <- "/home/jonas/Documents/TheoMod/Assignment/Alcon.Coevolution/"


###########################################################
## The next thing to do is to define where the script 
## should save its results.
## This can be the same folder as the .R files, or any 
## other folder with writing permission.

# Please type the full path to the folder where results (first create results file in source file location) 
# should be saved.
result.file.location <- "/home/jonas/Documents/TheoMod/Assignment/Alcon.Coevolution/results/"


###########################################################
## Now we need a name to identify the results.
## The result file will anyway have the name :
## "Digital_Coevolution_Results_NodeID_Sys.Date_", 
## your filename will be added at the end of that.
result.file.name <- "standardrun"

###########################################################
# Here you can set if the results should be saved raw 
# or summarized or both, logical value FALSE or TRUE
raw.results <- FALSE
summarized.results <-TRUE

###########################################################
## In the lines below you can adjust some of the parameter 
## settings that influence the simulation

## Beware that combinations of large populations and 
## many replicates might overpower your computer.

# For how many time steps should the simulation run?
# It can help to think of that as days in the life 
# of a digital individual
duration.years <- 150

# Here you can set how often a snapshot of all individuals 
# should be saved. Every N timesteps
saving.intervall <- 1

# How many replicates should there be?
replicates <- 2

###########################################################
## Here you can adjust the parameters that influence the 
## digital organisms themselves

# How many host populations should there be, and how large
# should they be? This doesn't directly set the number
# of individuals, but the resources that are available 
# per population. More resources will lead to larger 
# populations, but the exact number of individuals 
# that will result depends on many things.
host.populations <- c(500,500) 

# How many host genotypes should there be?
# Note that as default, each host genotype gets its own
# parasite genotype as well. 
host.genotypes <- 5

# Which proportion of the host populations should 
# randomly migrate each time step
host.migration <- 0.05

# Which proportion of the parasite populations
# should randomly migrate?
parasite.migration <- 0.05

# How genotype specific should the infection
# be in percent?
parasite.specificity <- 1

# How virulent should the parasites be?
# Virulence is implemented as percent resources withdrawn
# per time step, depending on infection size -> infection size = density of parasites/ density dependence factor (15)
# virulence/15 = withdrawn/density = amount of resources withdrawn if 15 parasites are present
virulence <- 0.4

next.year.withdrawal <- 0.1 #proportion resources a plant will have less because of infection the previous year

# How much random drift should there be?
# Defined as proportion per timestep.
# This proportion of the host and the parasite population
# will additionally randomly be killed each timestep.
# A value of zero adds no additional random drift.
random.drift <- 0

##Ant parameters (in parasite reproduction parameter)
searching.area <- 3 #meters
colony.density <- 0.4 #colonies per m²
gentians.per.colony <- 4 #starting amount of gentians per colony 
K.factor <- 2 #how many more colonies than starting amount can be supported

parasitism.ant <- 0.1 # size proportion withdrawn from colony upon infection
ant.size.threshold <- 0.2 #size at which a population is not viable anymore
colony.growth.rate <- 0.2 #how much grows a population in size each tick

density.dependence <- 15 #from what density of parasites on a gentian is there density dep mortality  -> 1- ((density - density.dependence)/density)

# Read in the date, so that stuff can run over night without causing trouble
run.date <- Sys.Date()

###########################################################
## That's it. You have set all parameters. To run the 
## simulation either source this script or if you already 
## have executed the lines above, execute the remaining 
## lines as well.
###########################################################

###########################################################
## This sources a helper script that runs the simulation. 
print(paste("Simulation started :", Sys.time()))
source(file =  paste(source.file.location, "Alcon.Coevolution_Run.R", sep = ""), local = TRUE)
print("Congratulations, you have successfully run the Digital_Coevolution simulation. Now go and check out those amazing results.")
print(paste("Simulation ended", Sys.time()))
