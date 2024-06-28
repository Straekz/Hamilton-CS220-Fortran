!  AUTHOR: Tyrone Xue 
!  FILE: Fortran2018_Term1.f90 
!  PROGRAM: FortranRepl
!  FORTRAN COMPILER VERSION: Intel® Fortran Compiler 2024.0.2 [Intel(R) 64]
!****************************************************************************
!  CITATIONS
!  
!  CITE: Modern Fortran Explained: Incorporating Fortran 2018 by Michael Metcalf, John Reid, and Malcolm Cohen
!  DESC: Used for fact checking or looking up obvious things
!  
!  CITE: https://fortran-lang.discourse.group/t/print-and-write-in-same-line/6416
!  DESC: Way to print something without going into the next line
!    
!  CITE: https://www.tutorialspoint.com/fortran/fortran_logical_operators.htm
!  DESC: Tells me about how logical operators are written in Fortran (.and.)
!
!  CITE: https://www.tutorialspoint.com/fortran/fortran_strings.htm
!  DESC: Create strings through the character data type
!
!  CITE: https://stackoverflow.com/questions/59739472/how-to-check-if-two-strings-are-equal-in-fortran
!  DESC: Tells me about how relational operators are written in Fortran (/= for not equal)
!****************************************************************************

    program main
        implicit none ! Turns off Fortran's weak typing characteristic
        integer :: i
        i = 0
        do while (i /= 100)
            i = i + 1
            if (mod(i,2) == 0) then
                cycle
            else if (i == 51) then
                exit 
            end if
            print*, i
        end do

            
        !integer :: enter
        !character(len = 20) :: finish ! Similar to a string that can be at most 20 characters
        !i = 0
        !! While loop that asks for a number and multiplies it by the index
        !do while ( (finish /= "done") .and. (i /= 100) ) ! /= is the syntax for not equal to
        !    print *, "Index: ", i
        !    write(*, '(a)', advance='no') " Provide a number: " ! Prints the statement without going into the next line
        !    read(*, *) enter ! Reads for an integer user-input that's put into the enter variable
        !    print *, "Your number times the index: ", i * enter
        !    write(*, '(a)', advance='no') " Type 'done' to end program: "
        !    read(*,*) finish ! Reads for a character user-input to put into the finish variable. 
        !    !If finish equals to "done", the while loop will end after this iteration. Continues otherwise until i = 100
        !    write(*,*) ! Prints a new line
        !    i = i + 1
        !end do
        !! if statement that provides a concluding response to this program
        !if (finish == "done") then
        !    write(*,*) "You have quit the program after index: ", i - 1
        !else if (i > 99) then ! If you went through the while loop 100 times, it quits for you. Then tells you the statement below
        !    write(*,*) " You've used this program enough..."
        !end if
    end program main