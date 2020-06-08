program client

  use iso_c_binding, only: c_int, c_char, c_null_char, c_size_t, c_int64_t, &
                           c_carriage_return, c_new_line
  use mod_dill, only: ipaddr, ipaddr_remote, IPADDR_IPV4, mrecv, tcp_connect, &
                      suffix_attach

  implicit none
  integer(c_int) :: rc, connection
  integer(c_size_t) :: message_size, msglen = 64
  type(ipaddr) :: addr
  character(c_char) :: message(64) = ''
  character(len=*), parameter :: TCP_SUFFIX = c_carriage_return // c_new_line // c_null_char

  rc = ipaddr_remote(addr, '127.0.0.1' // c_null_char, 5555_c_int, IPADDR_IPV4, -1_c_int64_t)
  connection = tcp_connect(addr, -1_c_int64_t)
  connection = suffix_attach(connection, TCP_SUFFIX, 2_c_size_t)
  message_size = mrecv(connection, message, msglen, -1_c_int64_t)
  print *, message_size, message

end program client
