  0 PRINT CHR$(17):Z$=CHR$(27)
  1 GOSUB 4:LOAD"INTRO"
  2 GOSUB 4:LOAD"HOBBIT"
  3 END
  4 CLS:TEXT:CLS:POKE#BB80+35,0
  5 LOAD"FONT6X8.BIN",A#B500
  6 PRINT@15,11;Z$;"N";Z$;"FLOADING"
  7 PRINT@15,12;Z$;"N";Z$;"BLOADING"
  8 RETURN
  