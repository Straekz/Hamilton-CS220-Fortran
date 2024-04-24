        !COMPILER-GENERATED INTERFACE MODULE: Tue Apr 23 20:44:25 2024
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE ROWECHELON__genmod
          INTERFACE 
            FUNCTION ROWECHELON(MATRIX)
              REAL(KIND=4), INTENT(IN) :: MATRIX(:,:)
              REAL(KIND=4) :: ROWECHELON(SIZE(MATRIX,1),SIZE(MATRIX,2))
            END FUNCTION ROWECHELON
          END INTERFACE 
        END MODULE ROWECHELON__genmod
