#NO_LIB=1

SRC=main.c print.s
BIN=hello_world_mixed
OBJ=$(SRC:.c=.o)
OBJ+=$(SRC:.s=.o)
include ../../rules.mk

all: $(DATA) $(SRC) $(BIN)

