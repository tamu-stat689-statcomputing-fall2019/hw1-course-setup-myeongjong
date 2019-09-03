# Generate n-dimensional response Y that follows linear regression model Y = Xbeta + epsilon, where epsilon is normal zero with variance sigma^2 independent across samples. Seed should be set at the beginning of the function
# X - design matrix
# beta - given parameter vector
# sigma - standard deviation of the noise
# seed  - starting seed value
generateY <- function(X, beta, sigma, seed = 5832652){
  #[ToDo] Set seed and generate Y following linear model
  set.seed(seed)
  Y <- as.numeric(X %*% as.matrix(beta)) + rnorm(nrow(X), 0, sd = sigma)
  # Return Y
  return(Y)
}

# Calculate beta_LS - least-squares solution, do not use lm function
# X - design matrix
# Y -response

calculateBeta_old <- function(X, Y){
  # [ToDo]Calculate beta_LS
  beta_LS <- as.numeric(solve(t(X) %*% X) %*% t(X) %*% as.matrix(Y))
  
  # Return beta
  return(beta_LS)
}


calculateBeta <- function(X, Y){
  # [ToDo]Calculate beta_LS
  # previous version: calculateBeta_old()
  beta_LS <- as.numeric(solve(crossprod(X), crossprod(X, Y)))
  
  # Return beta
  return(beta_LS)
}

# Calculate MSE

calculateMSE_old <- function(beta, beta_LS){
  # [ToDo] Calculate MSE
  MSE <- mean((beta - beta_LS)^2)
  
  # Return MSE - error ||beta - beta_LS||_2^2
  return(MSE)
}

calculateMSE <- function(beta, beta_LS){
  # [ToDo] Calculate MSE
  # previous version: calculateMSE_old()
  MSE <- as.numeric(crossprod(beta - beta_LS)) / length(beta)
  
  # Return MSE - error ||beta - beta_LS||_2^2
  return(MSE)
}