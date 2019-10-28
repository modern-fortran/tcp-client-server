# tcp-client-server

A simple TCP client and server in Fortran, used to teach interoperability with C.
Companion code for Chapter 11 of [Modern Fortran: Building Efficient Parallel Applications](https://www.manning.com/books/modern-fortran?a_aid=modernfortran&a_bid=2dc4d442).

## Getting started

```
git clone https://github.com/modern-fortran/tcp-client-server
cd tcp-client-server
make
```

## Running the server

In one terminal window, run the server:

```
./server 
 Listening on socket:
   IP address: 127.0.0.1                                    
   Port:         5555
```

## Running the client

In another terminal window, run the client:

```
./client 
                    5 Hello 
```

On client connection, the server will report:

```
 New connection from 127.0.0.1
```
