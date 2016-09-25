//+------------------------------------------------------------------+
//|                                                     etatOpen.mqh |
//|                                                          Antoine |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Antoine"
#property link      "https://www.mql5.com"
#property strict

int etatOpen(int i) {
   double position;
   if (High[i]-Low[i] == 0)
      position = (High[i]-Open[i]) / (High[i]-Low[i]+0.01);
   else
      position = (High[i]-Open[i]) / (High[i]-Low[i]);
   int etatOpen;
   
   if (position <= 0.33333) {
      etatOpen = 1;
   }
   else if (0.33333 < position && position <= 0.66666) {
      etatOpen = 0;
   }
   else {
      etatOpen = -1;
   }
   
   return etatOpen;
}