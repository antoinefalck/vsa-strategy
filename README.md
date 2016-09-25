# Volume Spread Analysis strategy

To use these codes simply place the files in the same folder names of your *MT4* plateform.
Then just open the template named "SOS_SOW.tpl".

For further informations you can email me at `antoine.falck@gmail.com`

This repo includes :
- Modified indicators of Volume and Moving Average (`screen1.png`)
- 2 indicators that let you know if the market shows signs of strenght or weakness (`screen2.png`)

## Modified indicators

### Principal window

- A moving average, with an avering period of 23, calculated on the closing prices
- The color of the moving average indicator :
  - **Green** if the *n* MA is higher than the *n-1* MA and the *n* price closing is higher than the *n* MA
  - **Red** if the *n* MA is lower than the *n-1* MA and the *n* price closing is lower than the *n* MA
  - else it is **gray**
  
### Volumes window

- A moving average, with an avering period of 14
- Three Bollinger Bands with standard deviations of 0.4, 1 and 2
- The color of the bars :
  - If the *n* Volume is superior than the *n-1* Volume
    - **Neon green** if the MA is green
    - **Pale green** if the MA is gray or red
  - If the *n* Volume is lower than the *n-1* Volume
    - **Red** if the MA is red
    - **Orange** if the MA is gray or green

## SOS SOW Indicators

When the market shows signs of strenght the indicator displays a green up-arrow under the *n* bar. On the other hand when it shows signs of weakness, there is a red down-arrow above the current bar.

To determine if there are signs of strengh or weakness, the algorithm determines if the current situation matches with one of the scenario described in *TradeGuider VSA Trade Set Up Sequences* by Gavin Holmes.

For further informations please contact me.
