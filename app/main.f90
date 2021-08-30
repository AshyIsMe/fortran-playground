program main
  use fortran_playground, only: say_hello, zeroes, iota
  implicit none
  integer :: zs(5), is(5)

  zs = zeroes(5)
  print *, 'zs:', zs

  is = iota(5)
  print *, 'is:', is

  call say_hello()
end program main
