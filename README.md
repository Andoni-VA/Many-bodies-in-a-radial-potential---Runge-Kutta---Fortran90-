# Many-bodies-in-a-radial-potential---Runge-Kutta---Fortran90-
n particles are positioned randomly and with a random initial velocity in a 2D radial potential V(r). This repository tries to compute the path that the particles describe using numerical methods, Runge-Kutta for numerical derivation specifically, and to plot it via gnuplot.

# Guide
1. To change the number of particles we use the parameter p
2. To change the initial position (currently random) we use the parameters x1 and y1
3. To change the initial velocity (currently random) we use the parameters x2 and y2

# To compile and plot

In bash shell: F -o many_bodies rk4.f90 mcf_tipos.f90 many_bodies.f90
In gnuplot: plot '3body.dat' u 2:3 w p

# Modules

1. Module fun :: contains the function that describes the effect of the forces (inside the main archive)
2. Module rk4 :: Runge-Kutta 4 method for numerical derivation
3. Module mcf_tipos :: useful to define the precision

# Example

We can find an example in the '5_body_problem.pdf' graph
