#pragma once

#include "ros/ros.h"

#include <mutex>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netinet/tcp.h>
#include <fcntl.h>

enum {
    SOCKET_FAIL = -1,
    SOCKET_OK = 1
} SOCKET_STATUS;

/** 
 * @brief This class serves as an abstraction layer for the BSD Socket API.
 * The first instance of Socket creates a nonblocking listening TCP socket.
 */
class Socket
{
    public:
        Socket();
        ~Socket();

        /**
         * @brief Accept incoming connection attempts from clients and create a new socket in nonblocking mode
         *
         * @return connection file describtor (is also stored in variable _connection_fd); returns SOCKET_FAIL if accept failed
         */
        int accept_connection();
        
        /**
         * @brief Send the specified amount of bytes to the client.
         * This method will block until it can write all data to the socket 
         * 
         * @param [in] tx_buffer 
         * @param [in] buffer_len
         * @return the amount of bytes sent if succesfull, SOCKET_FAIL if internal send() fails
         */
        int socket_send(uint8_t const* tx_buffer, int buffer_len);

        /**
         * @brief Receive data from the client.
         * This function will block until the specified amount of bytes are retrieved.
         * 
         * @param [out] rx_buffer
         * @param [in] recv_bytes
         * @return the amount of bytes received if succesfull, SOCKET_FAIL if internal recv() fails and recv would not block
         */
        int socket_receive(uint8_t* rx_buffer, int recv_bytes);

        /**
         * @brief Receive data from the client
         * This method will not block.
         * 
         * @param [out] rx_buffer
         * @param [in] recv_bytes
         * @return the amount of bytes received if succesfull, SOCKET_FAIL if internal recv() fails and recv would not block
         */
        int socket_receive_nonblock(uint8_t* rx_buffer, int recv_bytes);

        /**
         * @brief Receive until '\0' character or the specified amount of bytes is received.
         * This function will block until the above condition is met.
         * 
         * @param [out] rx_string
         * @param [in] max_bytes
         * @return the amount of bytes received if succesfull, SOCKET_FAIL if internal recv() fails and recv would not block
         */
        int socket_receive_string(std::string& rx_string, int max_bytes);

        /**
         * @brief Close and destroy the socket connection to the server.
         */ 
        void close_connection();

    private:

        /**
         * @brief Creates a TCP socket, which listens for connections from clients.
         * This function is only called once during the construction of the first socket object.
         */
        void _create_socket();

        int _connection_fd;

        int const _socket_port;
        int const _socket_max_conn;
        static int _socket_fd;
        struct sockaddr_in _socket_addr;
};