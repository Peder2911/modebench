#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export(name = ".staticGetMode")]]
double staticGetMode(NumericVector values) {
	int n = values.length();
   IntegerVector counts(n);

   for (int i = 0; i < n; ++i) {
        counts[i] = 0;
        int j = 0;
        while ((j < i) && (values[i] != values[j])) {
            ++j;
        }
        ++(counts[j]);
   }
	
   int maxCount = 0;
   for (int i = 1; i < n; ++i) {
      if (counts[i] > counts[maxCount]) {
         maxCount = i;
      }
   }
   return values[maxCount];
}

