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

    ! TODO: What's the correct syntax to reference a member array like this?
    !c = self % source(self % current)

    s = self % source
    i = self % current
    ! TODO: Even this throws the same error
    c = s(i)

    self % current = self % current + 1

    end subroutine advanceChar

end module mod_foo

program main
  use mod_foo

  implicit none
  type(Foo) :: foo = foo('foobar')

  print *, 'foo:', foo

  call foo % advanceChar(c)
  print *, 'c:', c

  call foo % advanceChar(c)
  print *, 'c:', c

end program main
