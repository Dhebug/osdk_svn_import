User Command 3.40       Generate makefile   $(SystemRoot)\system32\cmd.exe/   /v:on /c call $(OSDK)\bin\osdk_gen_makefile.cmd
   $(FileDir)             C     Clean   $(OSDK)\bin\make.exe   clean
   $(FileDir)             M     Make   $(OSDK)\bin\make.exe   all
   $(FileDir)             R     Run   $(OSDK)\bin\make.exe   test-oricutron
   $(FileDir)             E     Run (Euphoric)   $(OSDK)\bin\make.exe   test-euphoric
   $(FileDir)              O     Run (Oricutron)   $(OSDK)\bin\make.exe   test-oricutron
   $(FileDir)             D     Debug (Oricutron)   $(OSDK)\bin\make.exe   debug-oricutron
   $(FileDir)             D     Debug (Set Breakpoint)   $(OSDK)\bin\make.exe'   debug-oricutron BREAKPOINT=$(UserInput)
   $(FileDir)                    Generate makefile   $(SystemRoot)\system32\cmd.exe/   /v:on /c call $(OSDK)\bin\osdk_gen_makefile.cmd
   $(FileDir)                                                                                 