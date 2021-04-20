## Script based on the pdf tutorial

# directories
code.dir <- "./code"
data.dir <- "./data"

# full game of optical tracking data
dat <- read.csv(file=sprintf("%s/2013_11_01_MIA_BKN.csv", data.dir))

# Draw a specifc time point
source(sprintf("%s/constants.R", code.dir)) # loads libraries and constants used throughout code
source(sprintf("%s/graphics.R", code.dir)) # graphics/plotting functions
par(mar=c(0, 0, 0, 0))
data.plotter(dat, 1800)

# Load precomputed data
load(sprintf("%s/tdat.Rdata", data.dir))

# Player similarity matrix: H
load(sprintf("%s/playerbases.Rdata", data.dir))
players <- read.csv(sprintf("%s/players2013.csv", data.dir))
head(players)

# Plot occupancy matrix rows
par(mfrow=c(1,5))
for(i in 1:5)
  spatialPlot0(df[i, ], legend=F)

# Do the rest when the new data is put into a database
