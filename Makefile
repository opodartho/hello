IDIR = include
CC = gcc
CFLAGS = -I$(IDIR)

SRC = src
ODIR = $(SRC)/obj
LDIR = lib

LIBS = -lm

_DEPS = hellofunc.h
DEPS = $(patsubst %, $(IDIR)/%, $(_DEPS))

_OBJ = hello.o hellofunc.o
OBJ = $(patsubst %, $(ODIR)/%, $(_OBJ))

$(ODIR)/%.o: $(SRC)/%.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

home: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS) $(LIBS)

.PHONY: clean

clean:
	rm -f $(ODIR)/*.o *~ core $(INCDIR)/*~
