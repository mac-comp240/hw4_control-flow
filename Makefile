CC = gcc
OGFLAGS = -Og
O1FLAGS = -O1
CFLAGS = $(OFLAGS) -Wall -g

CINC =
F64 =-m64    #ensures 64-bit assembly


%.s: %.c
	$(CC) $(OGFLAGS) $(CINC) -S $(F64) $<

%_optO1.s: %.c
	$(CC) $(O1FLAGS) $(CINC) -S $(F64) $< -o $*_optO1.s

%_optOg.s: %.c
	$(CC) $(OGFLAGS) $(CINC) -S $(F64) $< -o $*_optOg.s


all:	control_optOg.s control_optO1.s 

compare:
	diff  control_optOg.s completed_control_optOg.s
	diff  control_optO1.s completed_control_optO1.s

clean:
	rm -f control_optOg.s control_optO1.s
