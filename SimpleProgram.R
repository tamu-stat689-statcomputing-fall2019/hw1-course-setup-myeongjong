# Generate data from linear regression model and calculate the least squares vector of coefficients
#####################################################################################################

# Model parameters
n = 100 # sample size
p = 10 # number of covariates
sigma = 2 # noise standard deviation
beta = rep(2,p) # true vector of coefficients
X = matrix(rnorm(n*p), n, p) # n by p matrix of predictors

# [ToDo] Use generateY function to generate Y
source("FunctionsLM.R")
Y <- generateY(X, beta, sigma)

# [ToDo] Use calculateBeta function to calculate beta_LS
(beta_LS <- calculateBeta(X, Y))
# [1] 1.775522 2.254873 1.929695 2.209177 2.335023 2.134707 2.104085 1.993899 1.877685 2.016066

# [ToDo] Use calculateMSE to assess the estimation error measured by squared eucledian distance - ||beta - beta_LS||_2^2
calculateMSE(beta, beta_LS)
# 0.03205253