#include "Socket.h"

#define SOCKET_PORT 2888
#define MAX_CONNECTION 10
#define KEEP_ALIVE_TIMEOUT 4
#define KEEP_ALIVE_PERIOD 1

int Socket::_socket_fd = -1;

Socket::Socket() : _socket_port{SOCKET_PORT}, _socket_max_conn{MAX_CONNECTION} 
{
    if(_socket_fd == -1)
    {
        _socket_addr.sin_family = AF_INET;
        _socket_addr.sin_port = htons(_socket_port);
        _socket_addr.sin_addr.s_addr = htonl(INADDR_ANY);

        _create_socket();
    }
}

Socket::~Socket() {}

void Socket::_create_socket()
{
    int cnt = 0;

    while(1)
    {
        _socket_fd = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);

        if (_socket_fd >= 0)
        {
            if(bind(_socket_fd, (struct sockaddr *)&_socket_addr, sizeof(_socket_addr)) >= 0)
            {
                if(listen(_socket_fd, _socket_max_conn) >= 0)
                {
                    ROS_INFO("Successful! Start accepting connections.");

                    int flags = fcntl(_socket_fd, F_GETFL);
                    fcntl(_socket_fd, F_SETFL, flags | O_NONBLOCK);

                    break;
                }
                else 
                    ROS_INFO("Listen for connections failed!");
            }
            else 
                ROS_INFO("Failed to bind socket!");

            close(_socket_fd);
        } 
        else
            ROS_INFO("Failed to create socket!");

        if(cnt < 4)
            ROS_INFO("Retrying... Attempt: %d", ++cnt);
        else
            exit(EXIT_FAILURE);
    }
}


int Socket::accept_connection()
{   
    
    _connection_fd = accept4(_socket_fd, NULL, NULL, SOCK_NONBLOCK);

    return _connection_fd;
}

int Socket::socket_receive(uint8_t* rx_buffer, int recv_bytes)
{
    int bytes_read = 0;
    int len = 0;

    do
    {   
        len = recv(_connection_fd, rx_buffer + bytes_read, recv_bytes - bytes_read, 0);

        if(len == SOCKET_FAIL && errno == EWOULDBLOCK)
            len = 0;

        bytes_read += len;

        if(bytes_read < recv_bytes)
            usleep(1000);
    } 
    while (bytes_read < recv_bytes && len != SOCKET_FAIL);

    return bytes_read;
}

int Socket::socket_receive_string(std::string& rx_string, int max_bytes)
{
    int bytes_read = 0;
    int len = 0;
    char rx_buffer[max_bytes];

    while(bytes_read < max_bytes)
    {   
        len = recv(_connection_fd, rx_buffer + bytes_read, 1, 0);

        if(len == SOCKET_FAIL && errno == EWOULDBLOCK)
        {
            len = 0;
            usleep(1000);
        }

        if(len == SOCKET_FAIL || rx_buffer[bytes_read] == '\0')
            break;
        else
            bytes_read += len;
    }

    if(len != SOCKET_FAIL)
        rx_string.assign(rx_buffer);
    else
        bytes_read = SOCKET_FAIL;
    
    return bytes_read;
}

int Socket::socket_receive_nonblock(uint8_t* rx_buffer, int recv_bytes)
{
    int len = recv(_connection_fd, rx_buffer, recv_bytes, 0);

    if(len == SOCKET_FAIL && errno == EWOULDBLOCK)
        len = 0;

    return len;
}

int Socket::socket_send(uint8_t const* tx_buffer, int buffer_len)
{   
    int len = 0;
    int bytes_sent = 0;

    while(bytes_sent < buffer_len)
    {
        len = send(_connection_fd, tx_buffer + bytes_sent, buffer_len - bytes_sent, 0);
        
        if(len == SOCKET_FAIL && errno == EWOULDBLOCK)
            len = 0;
        else if(len == SOCKET_FAIL)
        {
            bytes_sent = SOCKET_FAIL;
            break;
        }

        bytes_sent += len;

        if(bytes_sent < buffer_len)
            usleep(1000);
    }

    return len;
}

void Socket::close_connection()
{
    shutdown(_connection_fd, SHUT_RDWR);
    close(_connection_fd);
}