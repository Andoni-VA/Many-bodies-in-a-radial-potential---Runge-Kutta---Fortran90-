# Many-bodies-in-a-radial-potential---Runge-Kutta---Fortran90-
n particles are positioned randomly and with a random initial velocity in a 2D radial potential V(r). This repository tries to compute the path that the particles describe using numerical methods, Runge-Kutta for numerical derivation specifically, and to plot it via gnuplot.

# Guide
1. To change the number of particles we use the parameter p
2. To change the initial position (currently random) we use the parameters x1 and y1
3. To change the initial velocity (currently random) we use the parameters x2 and y2
4. To compile, in bash shell: F -o many_bodies rk4.f90 mcf_tipos.f90 many_bodies.f90
