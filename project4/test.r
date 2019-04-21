#STAT557
#homework 5 
#linear regression 

#1 
#create X matrix 4x2 
X = as.matrix(cbind(c(-1,0,1,2),c(-1.5,0.5,0.5,1.5)))

beta = t(rbind(c(0,1)))
theta = 1 

#(1) 
#what is E[w]? What is Cov[w]?
E = (beta)
Cov = theta^2*(solve((t(X)%*%X)))

#simulate 50 independent y dataset
#solve() gets the inverse of a matrix 

set.seed(200)
y = list()
for (i in 1:50){
  y[[i]] = X%*%beta + as.matrix(rnorm(4,0,1))
  #w = (X%*%Xt)^(-1)%*%Xt*y
  #print (y)
}
print(y)

#the least-squares estimate w 
W = list()
for (i in 1:50){
  Y = unlist(y[i])
  W[[i]] = round(solve(t(X)%*%X)%*%t(X)%*%Y,3)
}
W_m = matrix(unlist(W), ncol = 2, byrow = TRUE)
print(W_m)
dim(W_m) #50 2-dimensional matrix

#error ||w-beta||2
error = list()
w_beta_lst = list()
for (i in 1:50){
  w_beta_lst[[i]] = W_m[i,] - beta
  w_beta = W_m[i,] - beta
  error[i] = norm(w_beta,'2') #2 norm
}
W_beta = matrix(unlist(w_beta_lst), ncol = 2, byrow = TRUE)
error = unlist(error)
print (error) #50 (scalar error measurement)
print(W_beta)


#(2)
#emiprical mean and covariance of w 
#empirical mean of w
w_mean = colMeans(W_m)
print(w_mean)

#empirical covariance of w 
cov(W_m)

#alternative way to calculate the empirical mean and covatiance
matrix(data=1, nrow=50)
M_mean = matrix(data=1, nrow=50) %*% cbind(mean(W_m[,1]),mean(W_m[,2]))
print(M_mean)

#creates a difference matrix
D = W_m - M_mean
#creates the covariance matrix
C = (50-1)^-1*t(D) %*% D
print(C)



#(3) 
#scatter plot of w matrix and histogram of error
hist(error)

w1 = W_m[,1]
w2 = W_m[,2]
plot(W_m,xlab = 'w1',ylab = 'w2')

#(4)
#qq plot for w1 and w2 
qqnorm(w1,main = 'Normal Q-Q Plot of W1')
qqnorm(w2,main = 'Normal Q-Q Plot of W2')



#####
#2 repeat previous process 
X2 = as.matrix(cbind(c(-1,0,1,2),c(-1,0,1,2.1)))

E2 = beta
Cov2 = theta^2*(solve((t(X2)%*%X2)))
print(Cov2)

y2 = list()
for (i in 1:50){
  y2[[i]] = X2%*%beta + as.matrix(rnorm(4,0,1))
  #w = (X%*%Xt)^(-1)%*%Xt*y
  #print (y)
}
print(y2)

#the least-squares estimate w 
W2 = list()
for (i in 1:50){
  Y2 = unlist(y2[i])
  W2[[i]] = round(solve(t(X2)%*%X2)%*%t(X2)%*%Y2,3)
}
W_m2 = matrix(unlist(W2), ncol = 2, byrow = TRUE)
print(W_m2)
dim(W_m2) #50 2-dimensional matrix

#error ||w-beta||2
error2 = list()
for (i in 1:50){
  w_beta2 = W_m2[i,] - beta
  error2[i] = norm(w_beta2,'2') #2 norm
}
error2 = unlist(error2)
print (error) #50 (scalar error measurement)

#emiprical mean and covariance of w 
#empirical mean of w
w_mean2 = colMeans(W_m2)
print(w_mean)
#empirical covariance of w 
cov(W_m2)

#(3) 
#scatter plot of w matrix and histogram of error
hist(error2)

w2_1 = W_m2[,1]
w2_2 = W_m2[,2]
plot(W_m2,xlab = 'w1',ylab = 'w2')

#(4)
#qq plot for w1 and w2 
qqnorm(w2_1,main = 'Normal Q-Q Plot of W1')
qqnorm(w2_2,main = 'Normal Q-Q Plot of W2')


####
#3