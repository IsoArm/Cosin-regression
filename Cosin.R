library(tidyverse)
my_data<-tribble(
  ~x,     ~y,
  17.9,	33.76,
  23.68,	29.72,
  26.57, 27.75,
  30.57,	24.97,
  34.57, 22.25,
  38.57,	19.6,
  42.57,	17.06,
  46.57,	14.66,
  50.57,	12.4,
  54.57,	10.31,
  58.57,	8.39,
  62.57,	6.66,
  66.57,	5.12,
  70.57,	3.77,
  74.57,	2.61,
  78.57,	1.64,
  79.96,	1.35
)
x<-my_data$x
y<-my_data$y
f <- function( omega ) { 
  x1 <- sin( omega * x )
  x2 <- cos( omega * x )
  r <- lm( y ~ x1 + x2 )
  res <- mean( residuals(r)^2 )
  attr( res, "coef" ) <- coef(r)
  res
}
omegas <- seq( .001, .5, length=1000 )
res <- sapply(omegas, f)
i <- which.min( res )
omega0 <- optimize(f, interval = c(omegas[i-1], omegas[i+1]))$minimum
p <- c( attr( f(omega0), "coef" ), omega0 )
plot( x, y )
lines( 
  x, 
  p[1] + p[2] * sin( p[4] * x ) + p[3] * cos( p[4] * x ),
  col = "orange", lwd=3 
)
a<-sqrt(p[2]^2+p[3]^2)
b<-omega0
c<-acos(p[3]/(sqrt(p[2]^2+p[3]^2)))
d<-p[1]
parameters<-c(a, omega0, c, d)
names(parameters)<-c("a", "b", "c", "d")