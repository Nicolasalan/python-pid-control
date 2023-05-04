#! /usr/bin/env python3

# Autor: Nicolas Alan

import matplotlib.pyplot as plt
import scipy.stats as stats
import sympy as sp 
import numpy as np 
import math

sp.init_printing()

# Inv Laplace
t, s = sp.symbols('t, s')
G = 2 / (s + 2)
func = sp.inverse_laplace_transform(G, s, t)
print("Inv Laplace: ", func)

# Laplace
t, s = sp.symbols('t, s')
a = sp.symbols('a', real=True, positive=True)
f = sp.exp(-a*t)
result = sp.laplace_transform(f, t, a, noconds=True)
print("Transform Laplace:", result)
