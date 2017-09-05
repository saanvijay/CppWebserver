# Makefile to build client/server

CFLAGS = -c -m64 -std=c++11 -fPIC -g
OFLAG  = -o
LD_FLAG = -lpthread -lboost_system
CC = g++

SERVER_SRC = server.cpp 
CLIENT_SRC = client.cpp 

SERVER_OBJ = server.o 
CLIENT_OBJ = client.o 

SERVER_EXE = server
CLIENT_EXE = clent


.PHONY: all
all : $(SERVER_EXE) $(CLIENT_EXE)

.PHONY: $(SERVER_EXE)
$(SERVER_EXE) : $(SERVER_OBJ)
	$(CC) $(OFLAG) $@ $^ $(LD_FLAG) 

.PHONY: $(CLIENT_EXE)
$(CLIENT_EXE) : $(CLIENT_OBJ)
	$(CC) $(OFLAG) $@ $^ $(LD_FLAG) 

%.o : %.cpp
	$(CC) $(CFLAGS) $(OFLAG) $@ $< $(LD_FLAG)


.PHONY : clean
clean :
	rm -rf $(SERVER_OBJ) $(SERVER_EXE)
	rm -rf $(CLIENT_OBJ) $(CLIENT_EXE)
