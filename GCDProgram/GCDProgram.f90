!  AUTHOR: Tyrone Xue 
!  FILE: GCDProgram.f90 
!  PROGRAM: GCDProgram
!  FORTRAN COMPILER VERSION: Intel® Fortran Compiler 2024.0.2 [Intel(R) 64]
!****************************************************************************
!  CITATIONS
!
!  CITE: https://sites.math.rutgers.edu/~greenfie/gs2004/euclid.html
!  DESC: Gave a general understanding of how the euclidean algorithm worked to calculate the GCD
!   
!  CITE: https://fortranwiki.org/fortran/show/recursion
!  DESC: Using "recursive" to indicate a recursive function
!
!  CITE: https://www.physicsforums.com/threads/goto-statement-mostly-regarding-fortran.510358/
!  DESC: Understanding how labels work in fortran and how "goto" can be used to jump to read code from the label
!****************************************************************************

recursive function GCD(a, b) result(x)
implicit none
    real, intent(in) :: a, b
    real :: x, div, mul
    integer :: i
    
    if (b == 0) then
        x = 0
        return
    end if
    
    div = a / b
    if (div /= int(div)) then
        i = 0
        mul = 0
        do while (mul < a)
            i = i + 1
            mul = b * i
        end do
        mul = b * (i - 1)
        x = GCD(b, a - mul)
    else
        x = b
    end if
end function GCD
    
program GCDProgram
implicit none
    real :: a, b, temp
    real :: GCD
    
        print*, "Program to find the greatest common divisor between 2 numbers."
100     print*, "Please provide positive integers only"
        write(*, '(1x, a)', advance='no'), "First number: "
        read(*, *) a
        write(*, '(1x, a)', advance='no'), "Second number: "
        read(*, *) b
    
        if (a > b) then
            temp = a
            a = b
            b = temp
        end if
        
        if ((a < 0) .or. (b < 0)) then
            print*, "Error: At least one number is not a positive integer! (var < 0)"
            print*
            goto 100
        end if
    
    temp = GCD(a, b)
    print*, "GCD: ", int(temp)
end program GCDProgram