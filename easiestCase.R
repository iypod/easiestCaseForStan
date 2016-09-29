library(rstan); rstan_options(auto_write = TRUE); options(mc.cores = parallel::detectCores())

N <- 100
y <- rnorm(N, mean = 5, sd = 3)
hist(y)

easyFit <- stan(file = 'easiestCase.stan')

print(easyFit, digits_summary = 1)
plot(easyFit)
pairs(easyFit)
hist(rstan::extract(easyFit)$sigma)
traceplot(easyFit, inc_warmup = T, ncol = 1)
stan_dens(easyFit, separate_chains = T)

shiny <- launch_shinystan(easyFit)

