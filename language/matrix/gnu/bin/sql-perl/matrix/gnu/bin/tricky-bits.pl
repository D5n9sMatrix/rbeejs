#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

# The two tricky bits are the semicolon at the end of the line and the \n, which adds a newline
# (line feed). If you have
#     a relatively new version of perl, you can use say instead of print to have the carriage
# return added automatically:
# Version ≥ 5.10.0
use feature 'say';
say "Hello World";
