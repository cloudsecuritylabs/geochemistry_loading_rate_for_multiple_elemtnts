#Program to calculate loading when concentration and flow are provided.
#Programmer: Ankan Basu, PG, CPG, Hydrogeologist/Geochemist
#Software deleveloped for Environmental Applications

#STEPS:
# Load data from a csv file
# Create a data frame
# review structure of data
# check summary of data
# check units used in the database
# APPLY FORMULA to calculate load using loops
# Save output to a csv file.

# note, you need to know units for each variables. flows and concentrations.

MS=read.csv("mine_seep_loading_from_2008.csv",header=T,sep=",",stringsAsFactors=FALSE)
MS
#str(MS)
#summary(MS)
#gmp to lpd--> gpm*5451

#Create an empty data frame to store calculation output
L=data.frame()
#length(MS[,1])
#Write the code to get the loading rate in Kgs/Day
for(i in 1:nrow(MS)) {
    for (j in 3:ncol(MS)){
    L[i,j-2]=MS[i,2]*5451*MS[i,j]*1e-6
  }
}

round(L,2)

loading=apply(L,2,mean, na.rm=TRUE)
loading.max=apply(L,2,max, na.rm=TRUE)
round(loading.max,2)


loading
names(loading)=names(MS)[3:9]
write.csv(loading, file = "loading_rate_kg_per_day_from_2008.csv")

