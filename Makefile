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

all:	control.no_cm_s control.O1_cm_s 

compare:
	diff -b -B -I '.ident*' -I '.file*' control.no_cm_s completed_control.no_cm_s
	diff -b -B -I '.ident*' -I '.file*' control.O1_cm_s completed_control.O1_cm_s

clean:
	rm -f control.no_cm_s control.O1_cm_s
