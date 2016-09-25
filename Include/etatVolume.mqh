//+------------------------------------------------------------------+
//|                                                   etatVolume.mqh |
//|                                                          Antoine |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Antoine"
#property link      "https://www.mql5.com"
#property strict

int etatVolume(int i, int period, double v_1, double v_2, double v_3) {

   double volume = Volume[i];
   int etatVolume;
   
   double indicator1h = averageVolume(i, period) + v_1*stdVolume(i, period);
   double indicator1b = averageVolume(i, period) - v_1*stdVolume(i, period);
   double indicator2h = averageVolume(i, period) + v_2*stdVolume(i, period);
   double indicator2b = averageVolume(i, period) - v_2*stdVolume(i, period);
   double indicator3h = averageVolume(i, period) + v_3*stdVolume(i, period);
   double indicator3b = averageVolume(i, period) - v_3*stdVolume(i, period);

   if (volume <= indicator3b)
      etatVolume = -3;
   else if (indicator3b < volume && volume <= indicator2b)
      etatVolume = -2;
   else if (indicator2b < volume && volume <= indicator1b)
      etatVolume = -1;
   else if (indicator1b < volume && volume <= indicator1h)
      etatVolume = 0;
   else if (indicator1h < volume && volume <= indicator2h)
      etatVolume = 1;
   else if (indicator2h < volume && volume <= indicator3h)
      etatVolume = 2;
   else
      etatVolume = 3;
      
   return etatVolume;
}

// Calcule la moyenne des mm derniers volumes
double averageVolume(int j, double period) {
   double volumeTotal = 0.0;
   
   for (int i=0;i<period;i++)
      volumeTotal += Volume[i+j];

   return volumeTotal / (period);
}

// Calcule l'ecart-type des mm derniers volumes
double stdVolume(int j, double period) {
   double sommeEcarts = 0;
   double averageVolume = averageVolume(j, period);
   
   for (int i=0;i<period;i++)
      sommeEcarts += (Volume[i+j]-averageVolume)*(Volume[i+j]-averageVolume);
   
   double variance = sommeEcarts / period;
   double ecartType = sqrt(variance);
   
   return ecartType;
}