!  AUTHOR: Tyrone Xue 
!  FILE: MatrixProgram.f90 
!  PROGRAM: MatrixProgram
!  FORTRAN COMPILER VERSION: Intel® Fortran Compiler 2024.0.2 [Intel(R) 64]
!****************************************************************************
!  CITATIONS
!
!  CITE: https://web.ics.purdue.edu/~cs154/lectures/lecture014.htm
!  DESC: Explains how functions work in fortran
!
!  CITE: https://www.youtube.com/watch?v=eps4SJfp2CA&ab_channel=AnyLearnNepal
!  DESC: How to use multidimensional arrays
!
!  CITE: https://www.quora.com/Can-a-function-return-a-matrix-in-Fortran-90
!  DESC: Explained how get a matrix from a function through one (of many) methods
!
!  CITE: https://ximera.osu.edu/linearalgebra/textbook/rowReduction/algorithm
!  DESC: Explained the gernal algorithm to reduce a matrix
!
!  CITE: https://pages.mtu.edu/~shene/COURSES/cs201/NOTES/chap04/general-do.html#:~:text=The%20EXIT%20Statement,bail%20out%20the%20containing%20loop.&text=In%20the%20above%2C%20statements%2D1,that%20contains%20the%20EXIT%20statement.
!  DESC: using EXIT to get out of a do loop
!
!  CITE: https://fortran-lang.discourse.group/t/best-way-to-declare-a-double-precision-in-fortran/69
!  DESC: Format for double precision (64-bit) values
!****************************************************************************
 
! Function that creates a matrix given its size
function createMatrix(row, col)
implicit none
    integer, intent(in) :: row, col
    real(8) createMatrix(row, col) 
    integer i, j
    real(8) input
    
    ! Asks the user for what values to fill the matrix based on row, column of the matrix
    do i = 1, row
        do j = 1, col
            ! fmt 1x is a single space, a indicates for a string, and i0 indicates for an integer
            write(*, fmt="(1x,a,i0)", advance='no') "(Row: ", i
            write(*, fmt="(1x,a,i0)", advance='no') ", Col: ", j
            write(*, '(a)', advance='no') "); Input: "
            read(*, *) input
            createMatrix(i, j) = input
        end do
    end do
end function 

! Function that prints a matrix based on its dimensions
function printMatrix(matrix)
implicit none
    real(8), intent(in) :: matrix(:,:)
    real(8) printMatrix(size(matrix,1), size(matrix,2))
    integer i, j
    printMatrix = matrix(:,:)
    
    do i = 1, size(matrix,1) ! Do loop through number of rows
        print*, (matrix(i, j), j = 1, size(matrix,2)) ! An inner print-loop from j to the number of columns
    end do
    print*
end function

! Function that obtains the reduced row echelon form of a matrix
function reducedRow_echelon(matrix) 
implicit none
    ! This comment applies to all functions: intent(in) indicates that this value is a parameter for the function
    real(8), intent(in) :: matrix(:,:)
    real(8) reducedRow_echelon(size(matrix,1), size(matrix,2))
    integer i, j, lead, jj, ii
    real(8) tempMatrix(1, size(matrix,2)), clearMatrix(1, size(matrix,2))
    real(8) div
    reducedRow_echelon = matrix(:,:)
    lead = 0
    
    
    do j = 1, size(matrix, 2) ! Iterate through each column 
        do i = (1 + lead), size(matrix,1) ! Iterate from the row of the last obtained leading one to the max # rows of matrix            
            if ((reducedRow_echelon(i,j) /= 0) .and. (i > lead)) then ! Checks for the first non-zero value in a column
                lead = lead + 1 ! Indicates the row of the current leading one
                
                ! Essentially swaps two rows in the matrix
                ! Saves all the values in a row into a temporary matrix
                do jj = j, size(matrix, 2)
                    tempMatrix(1, jj) = reducedRow_echelon(lead, jj)
                end do
                reducedRow_echelon(lead, :) = reducedRow_echelon(i, :) ! Turns are the values in the "lead" row with values from the ith row, from their respective columns
                ! Puts back the saved values from the temporary matrix into the ith row
                do jj = j, size(matrix, 2)
                    reducedRow_echelon(i, jj) = tempMatrix(1, jj)
                end do
                
                ! Makes it so that the row with the pivot is the only non-zero value by subtracting each row from the row with the pivot
                do ii = 1, size(matrix, 1)
                    if ((reducedRow_echelon(ii, j) /= 0) .and. (lead /= ii)) then
                        div =  reducedRow_echelon(ii, j) / reducedRow_echelon(lead, j) ! Divides the row to subtract by the pivot from the same column
                        reducedRow_echelon(ii, :) = reducedRow_echelon(ii, :) - (reducedRow_echelon(lead, :) * div) ! Zeros-out column by subtracting the current row by the row with the pivot
                    end if
                end do
                
                ! Divides everything in the row with the pivot such that the pivot becomes a leading one
                div = reducedRow_echelon(lead, j)
                do jj = j, size(matrix, 2)
                    reducedRow_echelon(lead, jj) = reducedRow_echelon(lead, jj) / div
                end do
                exit ! "Breaks" the i do loop and goes into the next iteration of the j do loop
            end if
        end do
    end do
    end function 

! Program that allows the user to create a matrix and then gives the reduced row echelon form of that matrix
! Because the number precision isn't infinitely accurate, there can be some miscalculations
program MatrixProgram
implicit none
    ! This interface allows the functions to be used within the MatrixProgram program block
      interface matrixSetup
         function createMatrix(row, col) 
            integer, intent(in) :: row, col
            real(8) createMatrix(row, col) 
        end function
        function printMatrix(matrix)
            real(8), intent(in) :: matrix(:,:)
            real(8) printMatrix(size(matrix,1), size(matrix,2)) 
        end function
      end interface
      
      ! This is a separate interface because printMatrix and reducedRow_echelon utilizes the same values
      interface matrixManipulation
        function reducedRow_echelon(matrix) 
           real(8), intent(in) :: matrix(:,:)
           real(8) reducedRow_echelon(size(matrix,1), size(matrix,2))
        end function
      end interface

      real(8), dimension(3,3) :: A ! Change the dimensions to change the size of the matrix
      
      print*, "Create Matrix"
      print*
      A = printMatrix(createMatrix(size(A, 1), size(A, 2)))
      print*, "Calculating Reduced Row Echelon Form of Matrix"
      print*
      A = printMatrix(reducedRow_echelon(A))
end program MatrixProgram