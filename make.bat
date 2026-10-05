md "misc compiler stuff"                                                                    &::makes a temporary directory to contain the excessive amount of files generated during compilation
cd "misc compiler stuff"                                                                    &::sets the current directory to the temporary one to contain the mess
"%cd%\..\gbdk\bin\lcc" -Wa-l -Wl-m -Wl-j -debug -DUSE_SFR_FOR_REG -c -o main.o ..\main.c    &::compiles the main.c file into an object file (messy)
"%cd%\..\gbdk\bin\lcc" -Wa-l -Wl-m -Wl-j -debug -DUSE_SFR_FOR_REG -o main.gb main.o         &::links the object file into a .gb file (also messy)
move main.gb ..                                                                             &::gets the .gb file out of the messy folder and puts it in the main directory
cd ..                                                                                       &::sets current directory back to the main one
rd /s /q "misc compiler stuff"                                                              &::deletes the folder full of excessive compilation files
@REM  cls