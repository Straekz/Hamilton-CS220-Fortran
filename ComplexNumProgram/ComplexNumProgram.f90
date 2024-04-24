!  AUTHOR: Tyrone Xue 
!  FILE: ComplexNumProgram.f90 
!  PROGRAM: ComplexNumProgram
!  FORTRAN COMPILER VERSION: Intel® Fortran Compiler 2024.0.2 [Intel(R) 64]
!****************************************************************************
!  CITATIONS
!
!  CITE: https://www.tutorialspoint.com/fortran/fortran_numbers.htm
!  DESC: Explanation of various fortran number types (especially complex type values)
!
!  CITE: https://www.math.hawaii.edu/~hile/fortran/fort3.htm
!  DESC: Explanation on how formatting works when writing or printing to output
!
!  CITE: https://gcc.gnu.org/onlinedocs/gcc-3.4.6/g77/REAL_0028_0029-and-AIMAG_0028_0029-of-Complex.html
!  DESC: Using real(expr) and aimag(expr) in order to get the real and imaginary parts, respectively, of a complex number
!
!  CITE: https://pages.mtu.edu/~shene/COURSES/cs201/NOTES/chap06/interface.html
!  DESC: Explanation of the interface block
!****************************************************************************

! Function that calculates a solution for the quadratic formula
! The result is the lesser/greater solution based on the mode given with would subtract or add the discriminant
function quadraticFormula(A, B, C, mode) ! x = (-B +- sqrt(B^2-4AC))/(2A)
implicit none
    ! intent(in) means that these values are parameters from the function
    real, intent(in) :: A, B, C
    integer, intent(in) :: mode ! mode = 0 -> subtracted form, mode != 0 -> added form
    complex quadraticFormula
    quadraticFormula = (0,0)
    quadraticFormula = B**2 - 4*A*C ! Discriminant B^2 - 4(A)(C)
    quadraticFormula = sqrt(quadraticFormula) ! sqrt(B^2-4AC))
    if (mode == 0) then
        quadraticFormula = -B - quadraticFormula ! (-B - sqrt(B^2-4AC))
    else
        quadraticFormula = -B + quadraticFormula ! (-B + sqrt(B^2-4AC))
    end if
    quadraticFormula = quadraticFormula / (2*A) ! (-B +- sqrt(B^2-4AC))/(2A), +- based on mode
end function 

! Function that prints complex numbers in a clean way
function complexClean_print(sol)
implicit none
    complex, intent(in) :: sol
    complex complexClean_print
    complexClean_print = sol
    ! real(sol) obtains the real part of the complex number
    ! aimag(sol) obtains the imaginary part of the complex number, real(expr) then processes it as a real number
    write(*, '(a, f, a, f, a)') "x = ", real(sol), " + ", real(aimag(sol)), "i"
    print*
end function

! Program that utilizes complex number types of Fortran to obtain the complex solutions of the quadratic equation    
program ComplexNumProgram
implicit none
    ! This interface allows the functions to be used within the ComplexNumProgram program block
    interface Quadratic
        function quadraticFormula(A, B, C, mode)
            real, intent(in) :: A, B, C
            integer, intent(in) :: mode
            complex quadraticFormula
        end function
        function complexClean_print(sol)
            complex, intent(in) :: sol
            complex complexClean_print
        end function
    end interface
    
    real :: A, B, C
    complex :: minusSolution, plusSolution
    
    write(*, "(a)"), "Reminder that the quadratic equation has the format Ax^2 - Bx + C = 0"
    ! The 1x in the 2nd argument for write tells write to write 1 space before printing the a (format for strings)
    write(*, '(1x, a)', advance='no') "A = "
    read(*, *) A
    write(*, '(1x, a)', advance='no') "B = "
    read(*, *) B
    write(*, '(1x, a)', advance='no') "C = "
    read(*, *) C
    print*
    ! An "a" indicates for a string and "f" indicates for a real    
    write(*, '(a, f, a, f, a, f, a)'), "Quadratic equation: ", A, "x^2 - ", B, "x + ", C, " = 0"
    print*
    
    minusSolution = quadraticFormula(A, B, C, 0)
    print*, "Solution 1: ", minusSolution
    minusSolution = complexClean_print(minusSolution)
    
    plusSolution = quadraticFormula(A, B, C, 1)
    print*, "Solution 2: ", plusSolution
    plusSolution = complexClean_print(plusSolution)
end program ComplexNumProgram