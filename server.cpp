#include <iostream>
#include <boost/asio/io_service.hpp>
#include <sys/socket.h>
#include <string.h>

int main() {
struct sockaddr sockaddr;
char *testMessage = "This is a test message from server...";

// 1. define socket
int socketfd = socket(AF_INET, SOCK_STREAM, 0);

// 2. bind the socket
bind(socketfd, &sockaddr, sizeof(sockaddr));

// 3. listen
listen(socketfd, 4);

// 4. Accept
int addr_len = sizeof(sockaddr);
int new_socket = accept(socketfd, &sockaddr, (socklen_t*)&addr_len);

// 5. send/receive
send(new_socket, testMessage, strlen(testMessage), 0);


return 0;
}
