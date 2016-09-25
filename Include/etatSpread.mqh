//+------------------------------------------------------------------+
//|                                                   etatSpread.mqh |
//|                                                          Antoine |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Antoine"
#property strict

int etatSpread(int i, int period, double s_1, double s_2) {
   
   int etatSpread;
   double spread = High[i]-Close[i];
   
   double indicator1h = averageSpread(i, period) + s_1*stdSpread(i, period);
   double indicator1b = averageSpread(i, period) - s_1*stdSpread(i, period);
   double indicator2h = averageSpread(i, period) + s_2*stdSpread(i, period);
   double indicator2b = averageSpread(i, period) - s_2*stdSpread(i, period);

   if (spread <= indicator2b)
      etatSpread = -2;
   else if (indicator2b < spread && spread <= indicator1b)
      etatSpread = -1;
   else if (indicator1b < spread && spread <= indicator1h)
      etatSpread = 0;
   else if (indicator1h < spread && spread <= indicator2h)
      etatSpread = 1;
   else
      etatSpread = 2;

   return etatSpread;
}

double averageSpread(int i, int period) {
   double sommeSpread = 0.0;
   
   for (int j=0;j<period;j++) {
      sommeSpread += High[i+j]-Low[i+j];
   }
   
   return sommeSpread / period;
}

double stdSpread(int i, int period) {
   double sommeEcarts = 0;
   double averageSpread = averageSpread(i, period);
   
   for (int j=0;j<period;j++)
      sommeEcarts += (High[i+j]-Low[i+j]-averageSpread)*(High[i+j]-Low[i+j]-averageSpread);
   
   double variance = sommeEcarts / period;
   double ecartType = sqrt(variance);
   
   return ecartType;
}