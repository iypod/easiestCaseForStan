data {
  int<lower = 0> N;
  real y[N];
}
parameters {
  real mu;
  real<lower = 0> sigma;
}
model {
  mu ~ normal(0, 10000);
//  sigma ~ normal(0, 10000);
  sigma ~ cauchy(0, 5);
  y ~ normal(mu, sigma);
}
