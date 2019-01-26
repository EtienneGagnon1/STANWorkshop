// template for Stan file.

data {
  int N;
  vector[N] x;
  vector[N] y;

}

parameters {
  
  real beta;
  real sigma;
  


}

model {
  
  beta ~ normal(2.0, 1.0);
  sigma ~ gamma(1.0, 1.0);
  y ~ normal(beta * x, sigma);
  


}


generated quantities{
  
  vector[N] y_pred;
  
  for (i in 1:N)
    y_pred[i] = normal_rng(beta * x[i], sigma);
    
}


