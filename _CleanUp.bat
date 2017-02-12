@echo off
title Delete temp files (Delphi)
color 02
cls
echo Deleting....
del *.ppu /s
del *.o /s
del *.~* /s
del *.dsk /s
del *.cfg /s
del *.dof /s
del *.bk? /s
del *.mps /s
del *.rst /s
del *.s /s
del *.a /s
del *.local /s
del *.identcache /s
del *.~dpr
del *.~dfm
del *.~pas
del *.~bpl
del *.~ddp
del *.~cfg
del *.~dsk
del *.dcu
del *.ddp
del *.log
del *.stat
del *.dproj
//pause
echo Clear...
exit