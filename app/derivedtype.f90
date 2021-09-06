module mod_foo
  implicit none

  type :: Foo
    character(10) :: source
    integer :: current = 1

  contains
    procedure, pass(self) :: advanceChar
  end type Foo

contains

  subroutine advanceChar(self, c)
    class(Foo), intent(inout) :: self
    character, intent(out) :: c

    character(10) :: s
    integer :: i

    s = self % source
    i = self % current
    c = s(i:i)

    self % current = self % current + 1

  end subroutine advanceChar

end module mod_foo

program main
  use mod_foo

  implicit none
  type(Foo) :: foo1 = Foo('foobar')
  character :: c
  integer :: i

  print *, 'foo:', foo1

  do i=1, 10
  call foo1 % advanceChar(c)
  print *, 'c:', c
  end do

end program main
