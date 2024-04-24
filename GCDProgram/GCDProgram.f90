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

! Recursive function that returns the greatest common divisor of positive integers a and b using the euclidean algorithm
! "recursive" indicates that this function is recursive in Fortran
recursive function GCD(a, b) result(x)
implicit none
    ! intent(in) means that these values are parameters from the function
    real, intent(in) :: a, b
    real :: x, div, mul
    integer :: i
    
    div = a / b
    if (div /= int(div)) then ! checks if there's a remainder when you divide a by b
        i = 0
        mul = 0
        do while (mul < a)
            i = i + 1
            mul = b * i
        end do
        mul = b * (i - 1)
        x = GCD(b, a - mul) ! Euclidean algorithm recursion
    else ! if there's no remainder, the GCD = b
        x = b
    end if
end function GCD

! Program that calculates the greatest common divisor between 2 positive integers
program GCDProgram
implicit none
    real :: a, b, temp
    real :: GCD ! This is the function GCD
    
        print*, "Program to find the greatest common divisor between 2 numbers."
100     print*, "Please provide positive integers only" ! 100 is a label which starts at this line of code
        write(*, '(1x, a)', advance='no'), "First number: "
        read(*, *) a
        write(*, '(1x, a)', advance='no'), "Second number: "
        read(*, *) b
    
        ! ensures that the first number is the larger number of the two
        if (a > b) then
            temp = a
            a = b
            b = temp
        end if
        
        ! checks if the numbers given are positive integers
        if ((a <= 0) .or. (b <= 0)) then
            print*, "Error: At least one number is not a positive integer! (var <= 0)"
            print*
            goto 100 ! If there's an error, it would jump the code to the 100 label and reruns the code from there
        end if
    
    temp = GCD(a, b)
    print*, "GCD: ", int(temp)
end program GCDProgram