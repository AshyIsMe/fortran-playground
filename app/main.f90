program main
  use fortran_playground, only: say_hello, zeroes, iota_1D, iota_2D
  use functional

  implicit none
  integer :: zs(5), is(5), is2(3,4)

  zs = zeroes(5)
  print *, 'zs:', zs

  is = iota_1D(5)
  print *, 'is:', is

  is2 = iota_2D(3,4)
  print *, 'is2:', is2

  call say_hello()

  print *, 'arange:', arange(0, 4)
end program main
