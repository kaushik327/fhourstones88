# GNU Makefile

CC = clang++
CFLAGS = -std=c++20 -O3 -march=native -flto -Wextra -Wall
CFILES = C4.cpp Search.cpp Window.cpp Game.cpp

C488 : 	Makefile $(CFILES)
	  $(CC) $(CFLAGS) -DWIDTH=8 -DHEIGHT=8 -DBOOKWORK=24 -DLOCKSIZE=50 -DTRANSIZE=8306069 $(CFILES) -o $@

C476 :  Makefile  $(CFILES)
	  $(CC) $(CFLAGS) -DWIDTH=7 -DHEIGHT=6 -DBOOKWORK=24 -DLOCKSIZE=32 -DTRANSIZE=131101 $(CFILES) -o $@

clean :
	rm -f C488 C476

all: clean C488 C476
	./test.sh