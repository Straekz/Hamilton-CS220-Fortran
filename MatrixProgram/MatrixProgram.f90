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
!****************************************************************************
 
function createMatrix(row, col)
implicit none
    integer, intent(in) :: row, col
    real createMatrix(row, col) 
    integer i, j
    real input
    
    do i = 1, row
        do j = 1, col
            write(*, fmt="(1x,a,i0)", advance='no') "(Row: ", i
            write(*, fmt="(1x,a,i0)", advance='no') ", Col: ", j
            write(*, '(a)', advance='no') "); Input: "
            read(*, *) input
            createMatrix(i, j) = input
        end do
    end do
end function 

function printMatrix(matrix)
implicit none
    real, intent(in) :: matrix(:,:)
    real printMatrix(size(matrix,1), size(matrix,2))
    integer i, j
    printMatrix = matrix(:,:)
    
    do i = 1, size(matrix,1)
        print*, (matrix(i, j), j = 1, size(matrix,2))
    end do
    print*
end function
    
function reducedRow_echelon(matrix) 
implicit none
    real, intent(in) :: matrix(:,:)
    real reducedRow_echelon(size(matrix,1), size(matrix,2))
    integer i, j, lead, jj, ii
    real tempMatrix(1, size(matrix,2)), clearMatrix(1, size(matrix,2))
    real div
    reducedRow_echelon = matrix(:,:)
    lead = 0
    
    do j = 1, size(matrix, 2)
        do i = (1 + lead), size(matrix,1)
            if ((reducedRow_echelon(i,j) /= 0) .and. (i > lead)) then
                lead = lead + 1
                do jj = j, size(matrix, 2)
                    tempMatrix(1, jj) = reducedRow_echelon(lead, jj)
                end do      
                reducedRow_echelon(lead, :) = reducedRow_echelon(i, :)        
                do jj = j, size(matrix, 2)
                    reducedRow_echelon(i, jj) = tempMatrix(1, jj)
                end do
            
                do ii = 1, size(matrix, 1)
                    if ((reducedRow_echelon(ii, j) /= 0) .and. (lead /= ii)) then
                        div =  reducedRow_echelon(ii, j) / reducedRow_echelon(lead, j)
                        do while (reducedRow_echelon(ii, j) /= 0)
                            reducedRow_echelon(ii, :) = reducedRow_echelon(ii, :) - (reducedRow_echelon(lead, :) * div)
                        end do
                    end if
                end do
      
                div = reducedRow_echelon(lead, j)
                do jj = j, size(matrix, 2)
                    reducedRow_echelon(lead, jj) = reducedRow_echelon(lead, jj) / div
                end do
                exit
            end if
        end do
    end do
end function 

program MatrixProgram
implicit none
      interface matrixSetup
         function createMatrix(row, col) 
            integer, intent(in) :: row, col
            real createMatrix(row, col) 
        end function
        function printMatrix(matrix)
            real, intent(in) :: matrix(:,:)
            real printMatrix(size(matrix,1), size(matrix,2)) 
        end function
      end interface
      
      interface matrixManipulation
        function reducedRow_echelon(matrix) 
           real, intent(in) :: matrix(:,:)
           real reducedRow_echelon(size(matrix,1), size(matrix,2))
        end function
      end interface

      real, dimension(3,3) :: A
      
      print*, "Create Matrix A"
      print*
      A = printMatrix(createMatrix(size(A, 1), size(A, 2)))
      print*, "Calculating Reduced Row Echelon Form of Matrix A"
      print*
      A = printMatrix(reducedRow_echelon(A))
end program MatrixProgram