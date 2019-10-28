module mod_dill

  use iso_c_binding, only: c_char, c_int, c_int64_t, c_size_t
  implicit none

  private
  public :: ipaddr, ipaddr_local, ipaddr_port, ipaddr_remote, ipaddr_str, &
            IPADDR_MAXSTRLEN, IPADDR_IPV4, IPADDR_IPV6, mrecv, msend, &
            suffix_attach, suffix_detach, tcp_accept, tcp_close, tcp_connect, &
            tcp_listen

  integer(c_int), parameter :: IPADDR_IPV4 = 1
  integer(c_int), parameter :: IPADDR_IPV6 = 2
  integer(c_int), parameter :: IPADDR_MAXSTRLEN = 46

  type, bind(c) :: ipaddr
    character(c_char) :: address(32)
  end type ipaddr

  interface

    integer(c_int) function ipaddr_local(addr, name, port, mode) &
                   bind(c, name='dill_ipaddr_local')
      import :: c_char, c_int, ipaddr
      type(ipaddr), intent(out) :: addr
      character(c_char), intent(in) :: name(*)
      integer(c_int), value, intent(in) :: port
      integer(c_int), value, intent(in) :: mode
    end function ipaddr_local

    integer(c_int) function ipaddr_port(addr) &
                   bind(c, name='dill_ipaddr_port')
      import :: c_int, ipaddr
      type(ipaddr), intent(in) :: addr
    end function ipaddr_port

    integer(c_int) function ipaddr_remote(addr, name, port, mode, deadline) &
                   bind(c, name='dill_ipaddr_remote')
      import :: c_char, c_int, c_int64_t, ipaddr
      type(ipaddr), intent(out) :: addr
      character(c_char), intent(in) :: name(*)
      integer(c_int), value, intent(in) :: port
      integer(c_int), value, intent(in) :: mode
      integer(c_int64_t), value, intent(in) :: deadline
    end function ipaddr_remote

    subroutine ipaddr_str(addr, buf) &
               bind(c, name='dill_ipaddr_str')
      import :: c_char, ipaddr
      type(ipaddr), intent(in) :: addr
      character(c_char), intent(in out) :: buf(*)
    end subroutine ipaddr_str

    integer(c_size_t) function mrecv(s, buf, len, deadline) &
                      bind(c, name='dill_mrecv')
      import :: c_char, c_int, c_int64_t, c_size_t
      integer(c_int), value, intent(in) :: s
      character(c_char), intent(in out) :: buf(*)
      integer(c_size_t), value, intent(in) :: len
      integer(c_int64_t), value, intent(in) :: deadline
    end function mrecv

    integer(c_int) function msend(s, buf, len, deadline) &
                   bind(c, name='dill_msend')
      import :: c_char, c_int, c_int64_t, c_size_t
      integer(c_int), value, intent(in) :: s
      character(c_char), intent(in) :: buf(*)
      integer(c_size_t), value, intent(in) :: len
      integer(c_int64_t), value, intent(in) :: deadline
    end function msend

    integer(c_int) function suffix_attach(s, suffix, suffixlen) &
                   bind(c, name='dill_suffix_attach')
      import :: c_char, c_int, c_size_t
      integer(c_int), value, intent(in) :: s
      character(c_char), intent(in) :: suffix(*)
      integer(c_size_t), value, intent(in) :: suffixlen
    end function suffix_attach

    integer(c_int) function suffix_detach(s, deadline) &
                   bind(c, name='dill_suffix_detach')
      import :: c_int, c_int64_t
      integer(c_int), value, intent(in) :: s
      integer(c_int64_t), value, intent(in) :: deadline
    end function suffix_detach

    integer(c_int) function tcp_accept(s, addr, deadline) &
                   bind(c, name='dill_tcp_accept')
      import :: c_int, c_int64_t, ipaddr
      integer(c_int), value, intent(in) :: s
      type(ipaddr), intent(out) :: addr
      integer(c_int64_t), value, intent(in) :: deadline
    end function tcp_accept

    integer(c_int) function tcp_close(s, deadline) &
                   bind(c, name='dill_tcp_close')
      import :: c_int, c_int64_t
      integer(c_int), value, intent(in) :: s
      integer(c_int64_t), value, intent(in) :: deadline
    end function tcp_close

    integer(c_int) function tcp_connect(addr, deadline) &
                   bind(c, name='dill_tcp_connect')
      import :: c_int, c_int64_t, ipaddr
      type(ipaddr), intent(in) :: addr
      integer(c_int64_t), value, intent(in) :: deadline
    end function tcp_connect

    integer(c_int) function tcp_listen(addr, backlog) &
                   bind(c, name='dill_tcp_listen')
      import :: c_int, ipaddr
      type(ipaddr), intent(in) :: addr
      integer(c_int), value, intent(in) :: backlog
    end function tcp_listen

  end interface

end module mod_dill
