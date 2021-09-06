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

    ! app/derivedtype.f90:18:4:
    ! 
    !    18 |     c = self % source(self % current)
    !       |    1
    ! Error: Unclassifiable statement at (1)
    ! TODO: What's the correct syntax to reference a member array like this?

    c = self % source(self % current)
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
