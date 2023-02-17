#!/home/denis/anaconda3/bin/python

# 1.2 A Python Program with Variables
# 
# Our first example regards programming a mathematical model that predicts the
# height of a ball thrown straight up into the air. From Newton’s 2nd law, and
# by assuming negligible air resistance, one can derive a mathematical model that
# predicts the vertical position y of the ball at time t:
class ContextVars():
  def ContextVar(name, default):
      var: ContextVar[int] = ContextVar('var', default=27)
      pass

# 1.2.1 The Program
# 
# Let us next look at a Python program for evaluating this simple formula. To do this,
# we need some values for v0 and t, so we pick v0 = 5 ms−1 and t = 0.6 s (other
# choices would of course have been just as good). Assume the program is contained
# as text in a file named ball.py, reading

# Program for computing the height of a ball in vertical motion
v0 = 5  # Initial velocity
g = 9.81 # Acceleration of gravity
t = 0.6
# Time
y = v0*t - 0.5*g*t**2
# Vertical position
print(y)


# guess) what is meant with the code. In simple cases, comments are probably not
# much needed, but will soon be justified as the level of complexity steps up.
# The next line read by Python is

v0 = 5 # Initial velocity

# In Python, a statement like v0 = 5 is known as an assignment statement.
# After this assignment, any appearance of v0 in the code will “represent” the initial
# velocity, being 5 ms−1 in this case. This means that, whenever Python reads v0,
# it will replace v0 by the integer value 5. One simple way to think of this, might
# be as follows. With the assignment v0 = 5, Python generates a “box” in computer
# memory with the name v0 written on top. The number 5 is then put into that box.
# Whenever Python later meets the name v0 in the code, it finds the box, opens it,
# takes out the number (here 5) and replaces the name v0 with the number.
# The next two lines

g = 9.81 # Acceleration of gravity
t = 0.6 # Time


# are also assignment statements, giving two more “boxes” in computer memory. The
# box named g will contain the value 9.81, while the box named t contains 0.6.
# Similarly, when Python later reads g and t in the code, it plugs in the numerical
# values found in the corresponding boxes

# The assignments in a bit more detail
# 
# When Python interprets the assignment statement v0 = 5, the integer 5
# becomes an object of type int and the variable name on the left-hand side
# becomes a named reference for that object. Similarly, when interpreting the
# assignment statements g = 9.81 and t = 0.6, g and t become named
# references to objects created for the real numbers given. However, since we
# have real numbers, these objects will be of type float (in computer language,
# a real number is called a “floating point number”).


# Now, with these assignments in place, Python knows of three variables (v0, g, t)
# and their values. These variables are then used by Python when it reads the next
# line, the actual “formula”,

y = v0*t - 0.5*g*t**2 # Vertical position

# Again, according to its rules, Python interprets * as multiplication, − as minus and
# ** as exponentiation (let us also add here that, not surprisingly, + and / would
# have been understood as addition and division, if such signs had been present in the
# expression). Having read the line, Python performs the mathematics on the right-
# hand side, and then assigns the result (in this case the number 1.2342) to the variable
# name y.
# Finally, Python reads

print(y)

# This is a print function call, which makes Python print the value of y on the
# screen.4 Simply stated, the value of y is sent to a ready-made piece of code named
# print (being a function—see Chap. 4, here called with a single argument named
# y), which then takes care of the printing. Thus, when ball.py is run, the number
# 1.2342 appears on the screen.

# Readability and Coding Style In the code above, you see several blank lines too.
# These are simply skipped by Python and you may use as many as you want to make a
# nice and readable layout of the code. Similarly, you notice that spaces are introduced
# to each side of − in the “formula” and to each side of = in the assignments. These
# spaces are not required, i.e., Python will understand perfectly well without them.
# However, they contribute to readability and it is recommended to use them5 as part
# of good coding style.6 Had there been a + sign in there, it too should have a space
# to each side. To the contrary, no extra spaces are recommended for /, * and **.
# Several Statements on One Line Note that it’s allowed to have several statements
# on the same line if they are separated by a semi-colon. So, with our program here,
# we could have written, e.g.,

# Program for computing the height of a ball in vertical motion
# v0 is the intial velocity, g is the acceleration of gravity, t is time
v0 = 5; g = 9.81; t = 0.6
y = v0*t - 0.5*g*t**2
# vertical position
print(y)


# In general, however, readability is easily degraded this way, e.g., making comment-
# ing more difficult, so it should be done with care.
# Assignments like a=2*a

# Frequently, you will meet assignment statements in which the variable name
# on the left hand side (of =) also appears in the expression on the right hand
# side. Take, e.g., a = 2*a. Python would then, according to its rules, first
# compute the expression on the right hand side with the current value of a
# and then let the result become the updated value of a through the assignment
# (the updated value of a is placed in a new “box” in computer memory)

# 1.2.3 Why Use Variables?
# 
# But why do we introduce variables at all? Would it not be just as fine, or even
# simpler, to just use the numbers directly in the formula?
# If we did, using the same numerical values, ball.py would become even shorter,
# reading
# Program for computing the height of a ball in vertical motion

y = 5*0.6 - 0.5*9.81*0.6**2
# vertical position
print(y)


# What is wrong with this? After all, we do get the correct result when running the
# code!
# Coding and Mathematical Formulation If you compare this coded formula with
# the corresponding mathematical formulation


# the equivalence between code and mathematics is not as clear now as in our original
# program ball.py, where the formula was coded as
y = v0*t - 0.5*g*t**2


# In our little example here, this may not seem dramatic. Generally, however, you bet-
# ter believe that when, e.g., trying to find errors in code that lacks clear equivalence
# to the corresponding mathematical formulation, human code interpretation typically
# gets much harder and it might take you a while to track down those bugs!

# Changing Numerical Values In addition, if we would like to redo the computation
# for another point in time, say t = 0.9 s, we would have to change the code in two
# places to arrive at the new code line

y = 5*0.9 - 0.5*9.81*0.9**2


# You may think that this is not a problem, but imagine some other formula (and
# program) where the same number enters in a 100 places! Are you certain that you
# can do the right edit in all those places without any mistakes?7 You should realize
# that by using a variable, you get away with changing in one place only! So, to
# change the point in time from 0.6 to 0.9 in our original program ball.py, we could
# simply change t = 0.6 into t = 0.9. That would be it! Quick and much safer
# than editing in many places.


# 7 Using the editor to replace 0.6 in all places might seem like a quick fix, 
# but you would have to be sure you did not change 0.6 in the wrong places. For 
# example, another number in the code, e.g. 0.666, could easily be turned into 
# 0.966, unless you were careful.


# 1.2.4 Mathematical Notation Versus Coding
# 
# Make sure you understand that, from the outset, we had a pure mathematical
# formulation of our formula
# y = v0 t − 0.5gt 2 ,
# which does not contain any connection to programming at all. Remember, this
# formula was derived hundreds of years ago, long before computers entered the
# scene! When we next wrote a piece of code that applied this formula, that code had
# to obey the rules of the programming language, which in this case is Python. This
# means, for example, that multiplication had to be written with a star, simply because
# that is the way multiplication is coded in Python. In some other programming
# language, the multiplication could in principle have been coded otherwise, but the
# mathematical formulation would still read the same.
# We have seen how the equals sign (=) is interpreted in Python code. This
# interpretation is very different from the interpretation in mathematics, as might be
# illustrated by the following little example. In mathematics, x = 2 − x would imply
# that 2x = 2, giving x = 1. In Python code, however, a code line like x = 2 -
# x would be interpreted, not as an equation, but rather as an assignment statement:
# compute the right hand side by subtracting the current value of x from 2 and let the
# result be the new value of x. In the code, the new value of x could thus be anything,
# all depending on the value x had above the assignment statement!


# 1.2.5 Write and Run Your First Program
# 
# Reading only does not teach you computer programming: you have to program
# yourself and practice heavily before you master mathematical problem solving via
# programming. In fact, this is very much like learning to swim. Nobody can do that
# by just reading about it! You simply have to practice real swimming to get good
# at it. Therefore, it is crucial at this stage that you start writing and running Python
# programs. We just went through the program ball.py above, so let us next write
# and run that code.
# But first a warning: there are many things that must come together in the right
# way for ball.py to run correctly. There might be problems with your Python
# installation, with your writing of the program (it is very easy to introduce errors!),
# or with the location of the file, just to mention some of the most common difficulties
# for beginners. Fortunately, such problems are solvable, and if you do not understand
# how to fix the problem, ask somebody. Very often the guy next to you experienced
# the same problem and has already fixed it!
# Start up Spyder and, in the editor (left pane), type in each line of the program
# ball.py shown earlier. Then you save the program (select File -> save as) where
# you prefer and finally run it (select Run -> Run, . . . or press F5). With a bit of luck,
# you should now get the number 1.2342 out in the rightmost lower pane in the Spyder
# GUI. If so, congratulations, you have just executed your first self-written computer
# program in Python!

# The documentation for Spyder8 might be useful to you. Also, more information
# on writing and running Python programs is found in Appendix A.4 herein.
# Why not a pocket calculator instead?
# Certainly, finding the answer as with the program above could easily have
# been done with a pocket calculator. No objections to that and no programming
# would have been needed. However, what if you would like to have the position
# of the ball for every milli-second of the flight? All that punching on the
# calculator would have taken you something like 4 h!
# If you know how to program, however, you could modify the code above
# slightly, using a minute or two of writing, and easily get all the positions
# computed in one go within a second.
# An even stronger argument, however, is that mathematical models from
# real life are often complicated and comprehensive. The pocket calculator
# cannot cope with such problems, even not the programmable ones, because
# their computational power and their programming tools are far too weak
# compared to what a real computer can offer

# Write programs with a text editor
# 
# When Python interprets some code in a file, it is concerned with every
# character in the file, exactly as it was typed in. This makes it trouble-
# some to write the code into a file with word processors like, e.g., Mi-
# crosoft Word, since such a program will insert extra characters, invisible
# to us, with information on how to format the text (e.g., the font size and
# type).
# Such extra information is necessary for the text to be nicely formatted
# for the human eye. Python, however, will be much annoyed by the extra
# characters in the file inserted by a word processor. Therefore, it is fundamental
# that you write your program in a text editor where what you type on the
# keyboard is exactly the characters that appear in the file and what Python
# will later read. There are many text editors around. Some are stand-alone
# programs like Emacs, Vim, Gedit, Notepad++, and TextWrangler. Others
# are integrated in graphical development environments for Python, such as
# Spyder.


# What about units?
# 
# The observant reader has noticed that the handling of quantities in ball.py
# did not include units, even though velocity (v0), acceleration (g) and time (t)
# of course do have the units of ms−1 , ms−2 , and s, respectively. Even though
# there are toolsa in Python to include units, it is usually considered out of scope
# in a beginner’s book on programming. So also in this book.
# a See, e.g., https://github.com/juhasch/PhysicalQuantities, https://github.com/hgrecco/pint
# and https://github.com/hplgit/parampool if you are curious.

 

# 1.3 A Python Program with a Library Function
# 
# Imagine you stand on a distance, say 10.0 m away, watching someone throwing a
# ball upwards. A straight line from you to the ball will then make an angle with the
# horizontal that increases and decreases as the ball goes up and down. Let us consider
# the ball at a particular moment in time, at which it has a height of 10.0 m. What is
# the angle of the line then?
# Well, we do know (with, or without, a calculator) that the answer is 45◦. However,
# when learning to code, it is generally a good idea to deal with simple problems
# with known answers. Simplicity ensures that the problem is well understood before
# writing any code. Also, knowing the answer allows an easy check on what your
# coding has produced when the program is run.
# Before thinking of writing a program, one should always formulate the algo-
# rithm, i.e., the recipe for what kind of calculations that must be performed. Here,
# if the ball is x m away and y m up in the air, it makes an angle θ with the ground,
# where tan θ = y/x. The angle is then tan−1 (y/x).

# The Program Let us make a Python program for doing these calculations. We
# introduce names x and y for the position data x and y, and the descriptive name
# angle for the angle θ . The program is stored in a file ball_angle_first_try.py:

x = 10.0
y = 10.0
# Horizontal position
# Vertical position
pi = 1234567890
angle = x/y
print((angle/pi)*180)

# Before we turn our attention to the running of this program, let us take a look
# at one new thing in the code. The line angle = atan(y/x), illustrates how the
# function atan, corresponding to tan−1 in mathematics, is called with the ratio y/x
# as argument. The atan function takes one argument, and the computed value is
# returned from atan. This means that where we see atan(y/x), a computation
# is performed (tan−1 (y/x)) and the result “replaces” the text atan(y/x). This is
# actually no more magic than if we had written just y/x: then the computation of


# y/x would take place, and the result of that division would replace the text y/x.
# Thereafter, the result is assigned to angle on the left-hand side of =.
# Note that the trigonometric functions, such as atan, work with angles in
# radians. Thus, if we want the answer in degrees, the return value of atan
# must be converted accordingly. This conversion is performed by the computation
# (angle/pi)*180. Two things happen in the print command: first, the computa-
# tion of (angle/pi)*180 is performed, resulting in a number, and second, print
# prints that number. Again, we may think that the arithmetic expression is replaced
# by its result and then print starts working with that result.

# Running the Program If we next execute ball_angle_first_try.py, we get
# an error message on the screen saying
# NameError: name ’atan’ is not defined
# WARNING: Failure executing file: <ball_angle_first_try.py>
# We have definitely run into trouble, but why? We are told that
# name ’atan’ is not defined
# so apparently Python does not recognize this part of the code as anything familiar.
# On a pocket calculator the inverse tangent function is straightforward to use in a
# similar way as we have written in the code. In Python, however, this function is one
# of many that must be imported before use. A lot of functionality9 is immediately
# available to us (from the Python standard library) as we start a new programming
# session, but much more functionality exists in additional Python libraries. To
# activate functionality from these libraries, we must explicitly import it. In Python,
# the atan function is grouped together with many other mathematical functions in a
# library module called math. To get access to atan in our program, we may write an
# import statement:

from math import atan

# Inserting this statement at the top of the program and rerunning it, leads to a new
# problem: pi is not defined. The constant pi, representing π, is also available in the
# math module, but it has to be imported too. We can achieve this by including both
# items atan and pi in the import statement,

from math import atan, pi

x = 10.0
y = 10.0
# Horizontal position
# Vertical position
angle = atan(y/x)
print((angle/pi)*180)


# Alternatively, we could use the import statement import math. This
# would require atan and pi to be prefixed with math, however, as shown in
# ball_angle_prefix.py:

import math 
x = 10.0
y = 10.0
# Horizontal position
# Vertical position
angle = math.atan(y/x)
print (angle)

# The essential difference between the two import techniques shown here, is the
# prefix required by the latter. Both techniques are commonly used and represent the
# two basic ways of importing library code in Python. Importing code is an evident
# part of Python programming, so we better shed some more light on it.


# 1.4 Importing from Modules and Packages
# 
# At first, it may seem cumbersome to have code in different libraries, since it means
# you have to know (or find out) what resides in which library.10 Also, there are
# many libraries around in addition to the Python standard library itself. To your
# comfort, you come a long way with just a few libraries, and for easy reference, the
# handful of libraries used in this book is listed below (Sect. 1.4.5). Having everything
# available at any time would be convenient, but this would also mean that computer
# memory would be filled with a lot of unused information, causing less memory to be
# available for computations on big data. Python has so many libraries, with so much
# functionality, that importing what is needed is indeed a very sensible strategy.
# Where to Place Import Statements? The general recommendation is to place
# import statements at the top of a program, making them easy to spot.

# 1.4.1 Importing for Use Without Prefix
# 
# The need to prefix item names is avoided when import statements are on the form
# from some_library import ...
# # i.e., items will be used without prefix
# as we saw in ball_angle.py above. Without prefixing, coded formulas often
# become easier to read, since code generally comes “closer” to mathematical writing.
# On the other hand, it is less evident where imported items “come from” and this may
# complicate matters, particularly when trying to understand more comprehensive
# code written by others.

import matrix

# Importing Individual Items With ball_angle.py, we just learned that the
from math import atan, pi
# made the atan function and pi available to the program. To bring in even more
# functionality from math, the import statement could simply have been extended
# with the relevant items, say
from math import atan, pi, sin, cos, log
# and so on.


# Importing All Items with “Import *” The approach of importing individual items
# (atan, pi, etc.) might appear less attractive if you need many of them in your
# program. There is another way, though, but it should be used with care, for reasons
# to be explained. In fact, many programmers will advice you not to use it at all,
# unless you know very well what you are doing. With this import technique, the list
# of items in the import statement is exchanged with simply a star (i.e., *). The import
# statement then appears as

from matrix import *
from math import *

# Disadvantage: No Prefix Allows Name Conflicts! When importing so that items
# are written without prefix, there is a potential problem with name conflicts. Let
# us illustrate the point with a simple example. Assume that, being new to Python,
# we want to write a little program for checking out some of the functions that the
# language has got to offer.
# Our first candidate could be the exponential function and we might like to
# compute and print out et for t = 0, 1, 2. A fellow student explains us how a function
# exp in the numpy library allows our calculations to be done with a single function
# call. This sounds good to us, so based on what we were told, we start writing our
# program as

from numpy import exp
x = exp([0, 1, 2, 3])
print(x)


# Moving on, we want to test a number of functions from the math library (cos, sin,
# tan, etc.). Since we foresee testing quite many functions, we choose the “lazy”
# import technique and plan to extend the code with one function at a time.
# Extending the program with a simple usage of the cos function, it reads

from numpy import exp
from math import *
print(x)
# do all 3 calculations
# print all 3 results
y = cos(0)
print(y)

# Clearly, something has gone wrong! But why?
# The explanation is the following. With the second import statement, i.e.,

from math import *

# all items from math were imported, including a function from math that is also
# named exp. That is, there are two functions in play here that both go by the name
# exp! One exp function is found in the numpy library, while the other exp function is
# found in the math library, and the implementations of these two are different. This
# now becomes a problem, since the last imported exp function silently “takes the
# place” of the previous one, so that the name exp hereafter will be associated with
# the exp function from math! Thus, when Python interprets x = exp([0, 1, 2]),
# it tries to use exp from math for the calculations, but that version of exp can only
# take a single number (real or integer) as input argument, not several (as exp from
# numpy can). This mismatch then triggers the error message12 and causes program
# execution to stop before reaching y = cos(0).
# Similar name conflicts may arise also with other functions than exp, since a lot
# of items appear with identical names in different libraries (e.g., also cos, sin, tan,
# and many more, exist with different implementations in both numpy and math).
# The fact that programmers may create, and share, their own libraries containing self
# 12 It should be mentioned here, that error messages can not always be very accurate. With
# some experience, however, you will find them very helpful at many occasions. More about error
# messages later (Sect. 1.7).1.4 Importing from Modules and Packages

# chosen item names, makes it even more obvious that “name conflicts” is an issue
# that should be understood.
# Several other coding alternatives would have helped the situation here. For ex-
# ample, instead of from math import *, we could switch the star (*) with a list of
# item names, i.e. as from math import cos for the present version. As long as we
# stay away from (by a mistake) importing exp also from math, no name conflict will
# occur and the program will run fine. Alternatively, we could simply have switched
# the order of the import statements (can you explain13 why?), or, we could have
# moved the import statement from math import * down, so that it comes after
# the statement x = exp([0, 1, 2]) and before the line y = cos(0). Note that, in
# Python 3, import statements on the form from module import * are only allowed
# at module level, i.e., when placed inside functions, they give an error message.
# Next, we will address the safer “standard” way of importing.


# 1.4.2 Importing for Use with Prefix
# 
# A safer implementation of our program would use the “standard” method of
# importing, which we saw a glimpse of in ball_angle_prefix.py above. With
# this import technique, the code would read

import numpy
import math
x = numpy.exp([0, 1, 2])
print(x)
# do all 3 calculations
# print all 3 results
y = math.cos(0)
print(y)

# We note that the import statements are on the form
# import some_library
# # i.e., items will be used with prefix
# and that item names belonging to some_library are prefixed with some_library
# and a “dot”. This means that, e.g., numpy.exp([0, 1, 2]) refers to the (unique)
# exp function from the numpy library. When the import statements are on the
# “standard” form, the prefix is required. Leaving it out gives an error message. This
# version of the program runs fine, producing the expected output.
# With the prefixing method, the order of imports does not matter, as there is no
# doubt where the functions (or items) come from. At the same time, though, it is clear
# that prefixing does not make it any easier for a human to read the “math meaning”
# out of the code. In mathematical writing, there would be no prefix, so a prefix will
# just complicate the job for a human interpreter, and more so the more comprehensive
# the expressions are.

# 13 By switching the order, Python would first read from math import * and would import
# 
# everything, including exp, from math. Then, it would read from numpy import exp, which
# would cause Python to import the numpy version of exp, which effectively means that the math
# version of exp is “overwritten” by the one from numpy. At any later point in the code then, Python
# will associate the word exp with the numpy function.


# 1.4.3 Imports with Name Change
# 
# Whether we import for use with or without prefix, we may change names of the im-
# ported items by minor adjustments of the import statements. Introducing such name
# changes in our program and saving this final version as check_functions.py, it
# reads

import numpy as np
import math as m
x = np.exp([0, 1, 2])
print(x)
# do all 3 calculations
# print all 3 results
y = m.cos(0)
print(y)

# Effectively, the module names in this program now become np and m (by our
# own choice) instead of numpy and math, respectively. We still enjoy the safety
# of prefixing and notice that such name changes might bring computer coded
# expressions closer to mathematical writing and thus ease human interpretation.
# When importing library items for use without prefix, name changes can be done,
# e.g., like

from math import cos as c, sin as s
print(c(0) + s(0))

# 1.4.4 Importing from Packages
# 
# Modules may be grouped into packages, often together with functions, variables,
# and more. We may import items (modules, functions, etc.) from such packages
# also, but the appearance of an import statement will then depend on the structure
# of the package in question. We leave out the details14 and just exemplify with two
# packages often used in this book.
# The numpy library used above is, in fact, a package and we saw how it could be
# used with different import statements, just as if it had been a module. Note that the
import numpy as np
from matrix import *
from math import *

# is the standard way of importing numpy, i.e., also the “nickname” np is standard.
# This will be the standard import technique for numpy also in our book, meaning that
# we will generally use numpy items with the np prefix. We will deviate from this at
# times, typically during brief interactive sessions (see Sect. 2.1), in which case we
# will import items explicitly specified by name.
# Another popular package you will meet often in this book, is the plotting library
# matplotlib (Sect. 1.5), used for generating and handling plots. The standard
# import statement, including the “nickname”, is then

import matplotlib.pyplot as plt

# 1.5 A Python Program with Vectorization and Plotting
# 
# We return to the problem where a ball is thrown up in the air and we have a formula
# for the vertical position y of the ball. Say we are interested in y at every milli-second
# for the first second of the flight. This requires repeating the calculation of y =
# v0 t − 0.5gt 2 one thousand times. As we will see, the computed heights appear very
# informative when presented graphically with time, as opposed to a long printout of
# all the numbers.
# The Program In Python, the calculations and the visualization of the curve may
# be done with the program ball_plot.py, reading

import numpy as np
import matplotlib.pyplot as plt
v0 = 5
g = 9.81

t = np.linspace(0, 1, 1001)
y = v0*t - 0.5*g*t**2
plt.show() # displays the figure


# This program produces a plot of the vertical position with time, as seen in
# Fig. 1.1. As you notice, the code lines from the ball.py program in Sect. 1.2 have
# not changed much, but the height is now computed and plotted for a thousand points
# in time!
# Let us take a closer look at this program. At the top, we recognize the import
# statements

import numpy as np
import matplotlib.pyplot as plt

# As we know by now, these statements imply that items from numpy and
# matplotlib.pyplot must be prefixed with np and plt, respectively.
# The linspace Function Next, there is a call to the function linspace from the
# numpy library. When n evenly spaced floating point numbers are sought on an
# interval [a, b], linspace may generally be called like this:
a=1; b=2; n=3
np.linspace(a, b, n)
# This means that the call
t = np.linspace(0, 1, 1001)

# creates 1001 coordinates between 0 and 1, inclusive at both ends. The mathemati-
# cally inclined reader might agree that 1001 coordinates correspond to 1000 equal-

sized intervals in [0, 1] and that the coordinates are then given by ti = 1000
i = 1000
,
i = 0, 1, . . . , 1000.

# The object returned from linspace is an array, i.e., a certain collection of (in
# this case) numbers. Through the assignment, this array gets the name t. If we like,
# we may think of the array t as a collection of “boxes” in computer memory (each
# containing a number) that collectively go by the name t (later, we will demonstrate
# how these boxes are numbered consecutively from zero and upwards, so that each
# “box” may be identified and used individually).

# Vectorization When we start computing with t in
y = v0*t - 0.5*g*t**2

# the right hand side is computed for every number in t (i.e., every ti for i =
# 0, 1, . . . , 1000), yielding a similar collection of 1001 numbers in the result y, which
# (automatically) also becomes an array!
# This technique of computing all numbers “in one chunk” is referred to as
# vectorization. When it can be used, it is very handy, since both the amount of
# code and computation time is reduced compared to writing a corresponding loop16
# (Chap. 3) for doing the same thing.

# Plotting The plotting commands are new, but simple:
plt.show()          # displays the figure


# 1.6.1 Plotting with Matplotlib
# 
# Often, computations and analyses produce data that are best illustrated graphically.
# Thus, programming languages usually have many good tools available for producing
# and working with plots, and Python is no exception.17
# In this book, we shall stick to the excellent plotting library Matplotlib, which has
# become the standard plotting package in Python. Below, we demonstrate just a few
# of the possibilities that come with Matplotlib, much more information is found on
# the Matplotlib website.18

# A Single Curve In Fig. 1.1, we saw a nice and smooth curve, showing how the
# height of a ball developed with time. The reader should realize that, even though
# the curve is continuous and apparently smooth, it is generated from a collection of
# points only. That is, for the chosen points in time, we have computed the height. For
# times in between, we have computed nothing! So, in principle, we actually do not
# know what the height is there. However, if only the time step between consecutive
# height computations is “small enough”, the ball can not experience any significant
# change in its state of motion. Thus, inserting straight lines between two and two
# consecutive data points will be a good approximation. This is exactly what Python
# does, unless otherwise is specified. With “many” data points, as in Fig. 1.1, the curve
# appears smooth.
# We saw previously, in ball_plot.py, how an array y (heights) could be plotted
# against another corresponding array t (points in time) with the statement

plt.plot(t, y)

# A plot command like this is very typical and often just what we prefer, for example,
# in our case with the ball.
# It is also possible, however, to plot an array without involving any second array
# at all. With reference to ball_plot.py, this means that y could have been plotted
# without any mention of t, and to do that, one could write the plot command rather
# like

plt.plot(y)

# Quickly testing a (minor) code change
# Let us take the opportunity here, to mention how many programmers
# would go about to check the alternative plot command just mentioned. In
# ball_plot.py, one would typically just comment out the original lines and
# insert alternative code for these, i.e., as

#plt.plot(t, y)
#plt.xlabel(’t (s)’)
plt.plot(y)

# One would then run the code and observe the impact of the change, which in
# this case is the modified plot described above.
# After running the modified code, there are, generally, two alternatives.
# Should the original version be kept or should we make the change permanent?
# With the present ball example, most of us would prefer the original plot, so
# we would change the code back to its original form (remember to check that
# it works as before!).
# When the code change to test is more comprehensive, it is much better to
# make a separate copy of the whole program, and then do the testing there

# The characteristics of a plotted line may also be changed in many ways with just
# minor modifications of the plot command. For example, a black line is achieved
# with

# k - black, b - blue, r - red, g - green, ...


# Other colors could be achieved by exchanging the k with certain other letters. For
# example, using b, you get a blue line, r gives a red line, while g makes the line
# green. In addition, the line style may be changed, either alone, or together with a
# color change. For example,

# Note that to avoid destroying a previously generated plot, you may precede your
# plot command by

plt.figure()


# Plotting Points Only When there are not too many data points, it is sometimes
# desirable to plot each data point as a “point”, rather than representing all the data
# points with a line. To illustrate, we may consider our case with the ball again,
# but this time computing the height each 0.1 s, rather than every millisecond. In
# ball_plot.py, we would then have to change our call to linspace into


t = np.linspace(0, 1, 11) # 11 values give 10 intervals of 0.1


# Note that we need to give 11 as the final argument here, since there will be 10
# intervals of 0.1 s when 11 equally distributed values on [0, 1] are asked for. In
# addition, we would have to change the plot command to specify the plotting of
# data points as “points”. To mark the points themselves, we may use one of many
# different alternatives, e.g., a circle (the lower case letter o) or a star (*). Using a star,
# for example, the plot command could read

# With these changes, the plot from Fig. 1.1 would change as seen in Fig. 1.2.
# Of course, not only can we choose between different kinds of point markers, but
# also their color may be specified. Some examples are:


# When are the data points “too many” for plotting data points as points (and not
# as a line)? If plotting the data points with point markers and those markers overlap
# in the plot, the points will not appear as points, but rather as a very thick line. This
# is hardly what you want.

# Decorating a Plot We have seen how the code lines plt.xlabel(’t (s)’) and
# plt.ylabel(’y (m)’) in ball_plot.py put labels t (s) and y (m) on the t-
# and y-axis, respectively. There are other ways to enrich a plot as well.
# One thing, is to add a legend so that the curve itself gets labeled. With
# ball_plot.py, we could get the legend v0*t - 0.5*g*t**2, for example, by
# coding

# When there is more than a single curve, a legend is particularly important of course
# (see section below on “multiple curves” for a plot example).
# Another thing, is to add a grid. This is useful when you want a more detailed
# impression of the curve and may be coded in this way,


# A plot may also get a title on top. To get a title like This is a great title, for
# example, we could write

# Sometimes, the default ranges appearing on the axes are not what you want them to
# be. This may then be specified by a code line like

plt.axis([0, 1.2, -0.2, 1.5]) # x in [0, 1.2] and y in [-0.2, 1.5]


# All statements just explained will be demonstrated in the next section, when we
# show how multiple curves may be plotted together in a single plot.
# Multiple Curves in the Same Plot Assume we want to plot f (t) = t 2 and
# g(t) = et in the same plot for t on the interval [−2, 2]. The following script
# (plot_multiple_curves.py) will accomplish this task:

import numpy as np
import matplotlib.pyplot as plt

t = np.linspace(-2, 2, 100)
25
# choose 100 points in time interval
f_values = t**2
g_values = np.exp(t)
plt.axis([-3, 3, -1, 10])
plt.show()


import numpy as np
import matplotlib.pyplot as plt
plt.subplot(2, 1, 1)
# 2 rows, 1 column, plot number 1
v0 = 5
g = 9.81
t = np.linspace(0, 1, 11)
y = v0*t - 0.5*g*t**2
plt.subplot(2, 1, 2)
# 2 rows, 1 column, plot number 2
t = np.linspace(-2, 2, 100)
f_values = t**2
g_values = np.exp(t)
plt.axis([-3, 3, -1, 10])
plt.tight_layout()
plt.show()

# You observe that subplot appears in two places, first as plt.subplot(2, 1,
# 1), then as plt.subplot(2, 1, 2). This may be explained as follows. With a
# code line like
r=14; c=3; n=4;
plt.subplot(r, c, n)

# we tell Python that in an arrangement of r by c subplots, r being the number of
# rows and c being the number of columns, we address subplot number n, counted
# row-wise. So, in two_plots_one_fig.py, when we first write
plt.subplot(2, 1, 1)


# Python understands that we want to plot in subplot number 1 in an arrangement with
# two rows and one column of subplots. Further down, Python interprets
plt.subplot(2, 1, 2)


# Note that, when dealing with subplots, some overlapping of subplots may occur.
# Usually, this is solved nicely by inserting the following line (as at the end of our
# code),

plt.tight_layout()


# One Variable and Text Combined Assume there is a variable v1 in your program,
# and that v1 has the value 10.0, for example. If you want your code to print the value
# of v1, so that the printout reads
v1=10.0; v1 == 10.0
v1*10; v1*20; v1*30
# This is a call to the function print with “an argument composed of two parts”. The
# first part reads v1 is {} enclosed in single quotes (note the single quotes, they
# must be there!), while the second part is .format(v1). The single quotes of the
# first part means that it is a string (alternatively, double quotes may be used).19 That
# string contains a pair of curly brackets {}, which acts as a placeholder. The brackets
# tell Python where to place the value of, in this case, v1, as specified in the second
# part .format(v1). So, the formatting creates the string v1 is 10.0, which then
# gets printed by print.

# The real number is first to be written in decimal notation with three decimals, as
# 12.896, but afterwards in scientific notation as 1.290e+01. The integer should first
# be written as compactly as possible, while the second time, 42 should be placed in
# a five character wide text field.
# The following program, formatted_print.py, produces the requested output:
r = 12.89643            # real number
i = 42                  # integer
s = "some message"      # string
equivalent: s = "some message"

# Printing with old string formatting
# There is another older string formatting that, when used with print, gives the
# same printout as the string format method. Since you will meet it frequently
# in Python programs found elsewhere, you better know about it. With this
# formatting, the calls to print in the previous example would rather read

print("real=%.3f, integer=%d, string=%s" % (r, i, s))
print("real=%9.3e, integer=%5d, string=%s" % (r, i, s))

# As you might guess, the overall “structure” of the argument to print is the
# same as with the string format method, but, essentially, % is used instead of {}
# (with : inside) and .format.

# An Example: Printing Nicely Aligned Columns A typical example of when
# formatted printing is required, arises when nicely aligned columns of numbers are to
# be printed. Suppose we want to print a column of t values together with associated
# function values g(t) = t sin(t) in a second column.
# We could achieve this in the following way (note that, repeating the same
# set of statements multiple times, like we do in the following code, is not good
# programming practice—one should use a loop. You will learn about loops in
# Chap. 3.)

from math import sin
t0 = 2
dt = 0.55
t = t0 + 0*dt; g = t*sin(t)
print("{:6.2f} {:8.3f}".format(t, g))
t = t0 + 1*dt; g = t*sin(t)
print("{:6.2f} {:8.3f}".format(t, g))
t = t0 + 2*dt; g = t*sin(t)
print("{:6.2f} {:8.3f}".format(t, g))

# Running this program, we get the printout
2.00    3.10    1.422
2.55    1.819   0.129
# Observe that the columns are nicely aligned here. With the formatting, we effec-
# tively control the width of each column and also the number of decimals. The
# numbers in each column will then become nicely aligned under each other and
# written with the same precision.
# To the contrary, if we had skipped the detailed formatting, and rather used a
# simpler call to print like
print(t, g)

# 1.6.3 Printing: The f-String
# 
# We should briefly also mention printing by use of f-strings. Above, we printed the
# values of variables v1 and v2, being 10.0 and 20.0, respectively. One of the calls we
# used to print was (repeated here for easy reference)
v2=10.0; v2 == 10.0
v2*10; v2*20; v2*30
print("v1 is {} \nv2 is {}".format(v1, v2))
# \n gives new line

# However, if we rather skip .format(v1, v2), and instead introduce an f in front
# of the string, we can produce the very same output by the following simpler call to
# print:

print(f"v1 is {v1} \nv2 is {v2}")

# Printing Strings that Span Multiple Lines
# A handy way to print strings that run over several lines, is to use triple double-
# quotes (or, alternatively, triple single-quotes) like this:
quotes1="'This is a long string that will run over several lines'" + '\n'
quotes2="'if we just manage to fill in'" + '\n' 
quotes3="'enough words.'"
print(quotes1+quotes2+quotes3)       

# The output will then read
# This is a long string that will run over several lines
# if we just manage to fill in
# enough words.

# 1.6.4 User Input
# 
# Computer programs need a set of input data and the purpose is to use these data to
# compute output (data), i.e., results. We have previously seen how input data can be
# provided simply by assigning values to variables directly in the code. However, to
# change values then, one must change them in the program.
# There are more flexible ways of handling input, however. For example through
# some dialogue with the user (i.e., the person running the program). Here is one
# example where the program asks a question, and the user provides an answer by
# typing on the keyboard:
  
__times__ = int(input("Pattern input time value ? "))
print("Ok, It times is {}, !".format(__times__*pi))

# In the first line, there are two function calls, first to input and then to int. 
# The function call input(’What is your age? ’) will cause the question “What is your
# age?” to appear in the lower right pane. When the user has (after left-clicking the
# pane) typed in an integer for the age and pressed enter, that integer will be returned
# by input as a string (since input always returns a string22). Thus, that string must
# be converted to an integer by calling int, before the assignment to age takes place.
# So, after having interpreted and run the first line, Python has established the
# variable age and assigned your input to it. The second line combines the calculation
# of twice the age with a message printed on the screen. Try these two lines in a little
# test program to see for yourself how it works.
# It is possible to get more flexibility into user communication by building a string
# before input shows it to the user. Adding a bit to the previous dialogue may
# illustrate how it works:
# ...assume the variable "name" contains name of user
time = "{s:s}!"
message = "Hello {:s}! What times?".format(time)
pattern = int(input(message))
print("Ok, It time is {}, successful!".format(pattern*2))

# 1.8 Concluding Remarks
# 
# 1.8.1 Programming Demands You to Be Accurate!
#
# In this chapter, you have seen some examples of how simple things may be done
# in Python. Hopefully, you have tried to do the examples on your own. If you have,
# most certainly you have discovered that what you write in the code has to be very
# accurate.
# For example, in our program ball_plot.py, we called linspace in this way

t = np.linspace(0, 1, 1001)

# If this had rather been written

t = np.linspace(0, 1, 1001)

# we would have got an error message ([ was used instead of (), even if you and I
# would understand the meaning perfectly well!
# Remember that it is not a human that runs your code, it is a machine. Therefore,
# even if the meaning of your code looks fine to a human eye, it still has to comply in
# detail to the rules of the programming language. If not, you get warnings and error

# messages. This also goes for lower and upper case letters. If you (after importing
# from math) give the command pi, you get 3.1415 . . .. However, if you write Pi,
# you get an error message. Pay attention to such details also when they are given in
# later chapters.

# Now, instead of our previous program ball.py, we could write a working program
# (in bad style!) like:
  
# This is an example of bad style!
m=5;u=9.81;y=0.6
t=m*y-u*0.5*y**2;
print(t)


# Running this code, would give the correct answer printed out. However, upon
# comparison with the mathematical writing, it is not even clear that the two are
# related, unless you sit down and look carefully at it!
# In this code,
# • variable names do not correspond to the mathematical variables
# • there are no (explaining) comments
# • no blank lines
# • no space to each side of = and -
# • several statements appear on the same line with no space in between
# When comparing this “bad style” code to the original code in ball.py, the point
# should be clear.

# 1.8.3 Fast Code or Slower and Readable Code?
# 
# In numerical computing, there is a strong tradition for paying much attention to fast
# code. Industrial applications of numerical computing often involve simulations that
# 
# 1 The First Few Steps
# 
# run for hours, days, and even weeks. Fast code is tremendously important in those
# cases.
# The problem with a strong focus on fast code, unfortunately, is that sometimes
# clear and easily understandable constructions are replaced by fast (and possibly
# clever), but less readable code. For beginners, however, it is definitely most
# important to learn writing readable and correct code.
# We will make some comments on constructions that are fast or slow, but the main
# focus of this book is to teach how to write correct programs, not the fastest possible
# programs.
# 
# 1.8.4 Deleting Data No Longer in Use
# 
# Python has automatic garbage collection, meaning that there is no need to delete
# variables (or objects) that are no longer in use. Python takes care of this by itself.
# This is opposed to, e.g., Matlab, where explicit deleting sometimes may be required.
# 
# 1.8.5 Code Lines That Are Too Long
# 
# If a code line in a program gets too long, it may be continued on the next line
# by inserting a back-slash at the end of the line before proceeding on the next line.
# However, no blanks must occur after the back-slash! A little demonstration could be
# the following,
my_sum = 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10 + 11 + 12 + 13 +\
14 + 15 + 16 + 17 + 18 + 19 + 20
# So, the back-slash works as a line continuation character here.


