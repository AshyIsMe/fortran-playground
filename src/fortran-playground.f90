module fortran_playground
  implicit none
  private

  public :: say_hello, zeroes, iota
contains
  subroutine say_hello
    print *, "Hello, fortran-playground!"
  end subroutine say_hello

  pure elemental integer function sum(a, b)
    integer, intent(in) :: a, b
    sum=a+b
  end function sum

  !TODO make this work like j: 2 3 4 $ 0
  pure function zeroes(a) result(zs)
    integer, intent(in) :: a
    !integer ::zs (size(a))
    integer ::zs (a)
    zs(:) = 0
  end function zeroes

  !TODO make this work like j: i. 2 3 4
  pure function iota(a) result(is)
    integer, intent(in) :: a
    integer ::is (a), i

    do i=1,a
      is(i) = i-1
    end do

  end function iota

end module fortran_playground
