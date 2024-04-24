        !COMPILER-GENERATED INTERFACE MODULE: Tue Apr 23 20:55:22 2024
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE CREATEMATRIX__genmod
          INTERFACE 
            FUNCTION CREATEMATRIX(ROW,COL)
              INTEGER(KIND=4), INTENT(IN) :: COL
              INTEGER(KIND=4), INTENT(IN) :: ROW
              REAL(KIND=4) :: CREATEMATRIX(ROW,COL)
            END FUNCTION CREATEMATRIX
          END INTERFACE 
        END MODULE CREATEMATRIX__genmod
