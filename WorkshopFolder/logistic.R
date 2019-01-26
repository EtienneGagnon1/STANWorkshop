rm(list = ls())
gc()


library(pacman)

library(rstan)  # should load version 2.18.2
library(ggplot2)
library(plyr)
library(tidyr)
library(dplyr)
library(tidyverse)


rstan_options(auto_write = TRUE)
set.seed(1954)

data <- read_rdump("data/logistic.data.r")

init <- function() {
  list(beta = rbinom(1, 1, 0.5))
}

init

fit <- stan(file = "model/logistic.stan",
            data = data,
            init = init)


summary(fit)


