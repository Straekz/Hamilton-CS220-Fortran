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
!****************************************************************************

function quadraticFormula(A, B, C, mode) ! x = (-B +- sqrt(B^2-4AC))/(2A)
implicit none
    real, intent(in) :: A, B, C
    integer, intent(in) :: mode ! mode = 0 -> subtracted form, mode != 0 -> added form
    complex quadraticFormula
    quadraticFormula = (0,0)
    quadraticFormula = B**2 - 4*A*C ! Discriminant B^2 - 4(A)(C)
    quadraticFormula = sqrt(quadraticFormula)
    if (mode == 0) then
        quadraticFormula = -B - quadraticFormula
    else
        quadraticFormula = -B + quadraticFormula
    end if
    quadraticFormula = quadraticFormula / (2*A)
end function 

function complexClean_print(sol)
implicit none
    complex, intent(in) :: sol
    complex complexClean_print
    complexClean_print = sol
    write(*, '(a, f, a, f, a)') "x = ", real(real(sol)), " + ", real(aimag(sol)), "i"
    print*
end function
    
program ComplexNumProgram
implicit none
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
    
    write(*, fmt="(a, i$)"), "Reminder that the quadratic equation has the format Ax^2 - Bx + C = 0"
    write(*, '(1x, a)', advance='no') "A = "
    read(*, *) A
    write(*, '(1x, a)', advance='no') "B = "
    read(*, *) B
    write(*, '(1x, a)', advance='no') "C = "
    read(*, *) C
    print*
    write(*, '(a, f, a, f, a, f, a)'), "Quadratic equation: ", A, "x^2 - ", B, "x + ", C, " = 0"
    print*
    
    minusSolution = quadraticFormula(A, B, C, 0)
    print*, "Solution 1: ", minusSolution
    minusSolution = complexClean_print(minusSolution)
    
    plusSolution = quadraticFormula(A, B, C, 1)
    print*, "Solution 2: ", plusSolution
    plusSolution = complexClean_print(plusSolution)
end program ComplexNumProgram