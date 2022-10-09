require(pacman)
p_load(terra, sf, fs, glue, tidyverse, gfcanalysis)

g <- gc(reset = T)
rm(list = ls())
options(scipen = 999)
