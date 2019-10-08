CC = gcc
OGFLAGS = -Og
O1FLAGS = -O1
CFLAGS = $(OFLAGS) -Wall

CINC =
F64 =-m64    #ensures 64-bit assembly


.SUFFIXES: .c .s .no_cm_s .O1_cm_s


.c.s:
	$(CC) $(OGFLAGS) $(CINC) -S $(F64) $*.c -o $*.s

.c.O1_cm_s:
	$(CC) $(O1FLAGS) $(CINC) -S $(F64) $*.c -o $*.O1_cm_s

.c.no_cm_s:
	$(CC) $(OGFLAGS) $(CINC) -S $(F64) $*.c -o $*.no_cm_s


all: files

files:	control.no_cm_s control.O1_cm_s

clean:
	rm -f control.no_cm_s control.O1_cm_s
