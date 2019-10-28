# tcp-client-server Makefile

CC = gcc
FC = gfortran

OBJS = mod_dill.o libdill.a

.PHONY: all clean
.SUFFIXES: .f90 .o

all: client server

client: client.f90 $(OBJS)
	$(FC) $< -o $@ libdill.a -pthread

server: server.f90 $(OBJS)
	$(FC) $< -o $@ libdill.a -pthread

libdill.a:
	curl http://libdill.org/libdill-2.14.tar.gz | tar xz
	cd libdill-2.14 && ./configure && make && cp .libs/libdill.a ..

.f90.o:
	$(FC) -c $<

%.o: %.mod

mod_dill.o: mod_dill.f90

clean:
	$(RM) -rf client server *.o *.mod
