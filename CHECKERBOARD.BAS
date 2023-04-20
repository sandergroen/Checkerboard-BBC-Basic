   10 MODE 2
   20 VDU 23, 1, 0
   30 index = 0
   40 ycount = 0
   50 xcount = 0
   60 width=1280
   65 modewidth =320
   70 heigth=1024
   75 modeheight = 200
   80 numColors = 64
   90 xblocks = INT(modewidth/numColors)
  100 yblocks = INT(modeheight/numColors)
  110 FOR Y=0 TO (modeheight - 1)
  120   IF ycount = yblocks THEN index = (index+1) MOD numColors
  130   IF ycount = yblocks THEN ycount = 0
  140   ycounter = ycounter + 1
  150   FOR X=0 TO (modewidth - 1)
  160     IF xcount = xblocks THEN index = (index+1) MOD numColors
  170     IF xcount = xblocks THEN xcount = 0
  180     xcount = xcount + 1
  190     PROC_DrawPixel((X*width/modewidth),(Y*heigth/modeheight),index)
  200   NEXT X
  210   *FX 19
  220 NEXT Y
  230 END
  240 DEF PROC_DrawPixel(x,y,color)
  250 GCOL 0,color
  260 PLOT 69,x,y
  270 ENDPROC