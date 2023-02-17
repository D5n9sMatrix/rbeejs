#!/home/denis/anaconda3/bin/python

# 4.1.7 Calling a Function Defined with Keyword Parameters
# 
# Let us adjust the previous program slightly, introducing keyword parameters in the
# definition. For example, if we use 0.6 as a default value for t, and aim to get the
# same printout as before, the program reads

def xy(v0x, v0y, t=0.6):
"""Compute horizontal and vertical positions at time t"""
g = 9.81
# acceleration of gravity
return v0x*t, v0y*t - 0.5*g*t**2
v_init_x = 2.0
v_init_y = 5.0
# initial velocity in x
# initial velocity in y
x, y = xy(v_init_x, v_init_y)
print("Horizontal position: {:g} , Vertical position: {:g}".format(x, y))
