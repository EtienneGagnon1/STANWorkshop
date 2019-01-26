// template for Stan file.

data {
  int<lower = 0> N;
  int<lower = 0> K;
  matrix[N, K] x;
  vector[N] y;
  

}

parameters {
  
  real alpha;
  vector[K] beta;
  real<lower = 0> sigma;
  
}

model {
  
  beta[1] ~ normal(1.0, 0.0);
  beta[2] ~ normal(1.0, 0.0);
  
  y ~ normal(x * beta + alpha, sigma);


}

