## Script based on the pdf tutorial

# directories
setwd("~/code/basketball/EPVDemo")
code.dir <- "./code"
data.dir <- "./data"

# full game of optical tracking data
dat <- read.csv(file=sprintf("%s/2013_11_01_MIA_BKN.csv", data.dir))

# Draw a specific time point
# loads libraries and constants used throughout code
source("./code/constants.R")
# graphics/plotting functions
source("./code/graphics.R")
par(mfrow=c(1,1))
data.plotter(dat, 1800)

# Load pre-computed data
load(sprintf("%s/tdat.Rdata", data.dir))

# Player similarity matrix: H
load(sprintf("%s/playerbases.Rdata", data.dir))
players <- read.csv(sprintf("%s/players2013.csv", data.dir))
head(players)

# Plot occupancy matrix rows
par(mfrow=c(1,5))


source(sprintf("%s/data_formatting.R", code.dir))
source(sprintf("%s/covariates.R", code.dir))
poss <- possession.indicator(dat) # infer ballcarrier... takes about a minute
tdat <- rearrange.data(dat, poss) # re-shuffle columns by to ballcarrier... (2 min)
tdat <- offensive.halfcourt(tdat) # transforming to offensive halfcourt
tdat <- offensive.ballcarrier(tdat)
touchID <- get.touchID(tdat)
covariates <- getAllCovars(tdat) # get covariates... (3 min)
tdat <- data.frame(tdat, touchID=touchID, covariates)
save(tdat, file=sprintf("%s/tdat.Rdata", data.dir))
for(i in 1:5)
  spatialPlot0(df[i, ], legend=F)

# Do the rest when the new data is put into a database
