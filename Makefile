# Makefile to build server

CFLAGS = -c -m64 -std=c++11 -fPIC -g
OFLAG  = -o
LD_FLAG = -lpthread -lboost_system
CC = g++

SERVER_SRC = server.cpp 

SERVER_OBJ = server.o 

SERVER_EXE = server


.PHONY: all
all : $(SERVER_EXE) 

.PHONY: $(SERVER_EXE)
$(SERVER_EXE) : $(SERVER_OBJ)
	$(CC) $(OFLAG) $@ $^ $(LD_FLAG) 

%.o : %.cpp
	$(CC) $(CFLAGS) $(OFLAG) $@ $< $(LD_FLAG)


.PHONY : clean
clean :
	rm -rf $(SERVER_OBJ) $(SERVER_EXE)
