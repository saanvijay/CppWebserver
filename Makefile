# Makefile to build server

CC = g++
CFLAGS = -c -std=c++11 -fPIC -g
LD_FLAG = -lpthread -lboost_system -lsocket
OFLAG  = -o

ARCH = $(shell uname)

ifeq ($(ARCH),SunOS)
LIB_DIR = -L/opt/csw/gxx/lib
INC_DIR = -I/opt/csw/gxx/include
endif



SERVER_SRC = server.cpp 

SERVER_OBJ = server.o 

SERVER_EXE = server


.PHONY: all
all : $(SERVER_EXE) 

.PHONY: $(SERVER_EXE)
$(SERVER_EXE) : $(SERVER_OBJ)
	$(CC) $(OFLAG) $@ $^ $(LD_FLAG) $(LIB_DIR)

%.o : %.cpp
	$(CC) $(CFLAGS) $(OFLAG) $@ $< $(LD_FLAG) $(INC_DIR)


.PHONY : clean
clean :
	rm -rf $(SERVER_OBJ) $(SERVER_EXE)
