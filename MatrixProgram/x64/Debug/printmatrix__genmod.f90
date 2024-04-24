        !COMPILER-GENERATED INTERFACE MODULE: Tue Apr 23 23:08:20 2024
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PRINTMATRIX__genmod
          INTERFACE 
            FUNCTION PRINTMATRIX(MATRIX)
              REAL(KIND=8), INTENT(IN) :: MATRIX(:,:)
              REAL(KIND=8) :: PRINTMATRIX(SIZE(MATRIX,1),SIZE(MATRIX,2))
            END FUNCTION PRINTMATRIX
          END INTERFACE 
        END MODULE PRINTMATRIX__genmod
