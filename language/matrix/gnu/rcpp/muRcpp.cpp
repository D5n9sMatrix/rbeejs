#include <Rcpp.h>
using namespace Rcpp;

// This is a simple example of exporting a C++ function to R. You can
// source this function into an R session using the Rcpp::sourceCpp 
// function (or via the Source button on the editor toolbar). Learn
// more about Rcpp at:
//
//   http://www.rcpp.org/
//   http://adv-r.had.co.nz/Rcpp.html
//   http://gallery.rcpp.org/
//

// [[Rcpp::export]]
// Add code below into C++ file Rcpp_example.cpp
#include <Rcpp.h>
using namespace Rcpp;
// Place the export tag right above function declaration.
// [[Rcpp::export]]
double muRcpp(NumericVector x){
  int n = x.size(); // Size of vector
  double sum = 0; // Sum value
  // For loop, note cpp index shift to 0
  for(int i = 0; i < n; i++){
    // Shorthand for sum = sum + x[i]
    sum += x[i];
  }
  return sum/n; // Obtain and return the Mean
}
// Place dependent functions above call or
// declare the function definition with:
double muRcpp(NumericVector x);
// [[Rcpp::export]]
double varRcpp(NumericVector x, bool bias = true){
  // Calculate the mean using C++ function
  double mean = muRcpp(x);
  double sum = 0;
  int n = x.size();
  for(int i = 0; i < n; i++){
    sum += pow(x[i] - mean, 2.0); // Square
  }
  return sum/(n-bias); // Return variance
}
// You can include R code blocks in C++ files processed with sourceCpp
// (useful for testing and development). The R code will be automatically 
// run after the compilation.
//

/*** R
timesTwo(42)
*/
