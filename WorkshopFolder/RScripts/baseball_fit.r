rm(list = ls())
gc()
set.seed(1954)

## Hierarchical models
library(rstan)
library(ggplot2)
library(plyr)
library(tidyr)
library(dplyr)

## read data
df <- read.csv("data/efron-morris-75-data.tsv", sep = "\t")
df <- with(df, data.frame(FirstName, LastName,
                          Hits, At.Bats,
                          RemainingAt.Bats,
                          RemainingHits = SeasonHits - Hits))

# split the data into a training and a validation set.
N <- dim(df)[1]
K <- df$At.Bats
y <- df$Hits
data =  c("N", "K", "y")

## fit the pool model.
fit_pool <- stan("model/baseball_pool.stan",
                 data = data,
                 chains = 4,
                 cores = min(4, parallel::detectCores()))

summary(fit_pool)[1]

## fit the no pooling model.
fit_no_pool <- stan("model/baseball_no_pool.stan",
                    data = data,
                    chains = 4,
                    cores = min(4, parallel::detectCores()))

summary(fit_no_pool)[1]
