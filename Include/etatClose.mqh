//+------------------------------------------------------------------+
//|                                                    etatClose.mqh |
//|                                                          Antoine |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Antoine"
#property strict

int etatClose(int i) {
   double position;
   int etatClose;
   if(High[i] - Low[i] != 0){
      position = (High[i]-Close[i]) / (High[i]-Low[i]);
      if (position <= 0.33333) {
         etatClose = 1;
      }
      else if (0.33333 < position && position <= 0.66666) {
         etatClose = 0;
      }
      else {
         etatClose = -1;
      }
   }
   else{
      if(High[i]-Close[i] < 0)
         etatClose = 1;
      if(High[i]-Close[i] > 0)
         etatClose = -1;
      if(High[i]-Close[i] == 0)
         etatClose = 0;
   }
   return etatClose;
}