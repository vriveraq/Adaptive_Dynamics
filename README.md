# Adaptive_Dynamics
In these MATLAB scripts we reproduce some of the figures in the Adaptive Dynamics literature. 

# Goal:
Adaptive Dynamics studies the effect of small changes (mutations) in the population in the long-term. By using the invasion fitness function, we can account for how a rare invader (mutant) can grow in an environment where a species is already at equilibrium. The outcomes can be the preservation of the species, the establishment of the invader, or coexistence. 

Our main goal is to investigate conditions in which coexistence is achieved since this has been shown to have important effects in how disease persists or dies out in an ecological system. 

The code provided here reproduces some of the figures in the Adaptive Dynamics literature were the conditions for coexistence were found. They both rely in studying the stability of ordinary  (ODE) and partial (PDE) differential frameworks. 

## List of references:

#### ODE: 
In this framework, we first compute the invasion fitness function for the system and then analyze parameter regions of coexistence through numerical simulations.

#### PDE: 
In this framework, we use analyze the conditions that lead to Turing instability for the system which in turn captures evolutionary branching.

[1] Génieys, S., Volpert, V., & Auger, P. (2006). Adaptive dynamics: modelling Darwin's divergence principle. Comptes Rendus Biologies, 329(11), 876-879.

Equation:
<img src="https://latex.codecogs.com/pdf.latex?\inline&space;\LARGE&space;\frac{\partial&space;f}{\partial&space;x}&space;(t,&space;x)&space;-d\Delta&space;f(t,&space;x)&space;=&space;af(t,&space;x)K&space;-&space;C(f)(t,&space;x)" title="\LARGE \frac{\partial f}{\partial x} (t, x) -d\Delta f(t, x) = af(t, x)K - C(f)(t, x)" />



