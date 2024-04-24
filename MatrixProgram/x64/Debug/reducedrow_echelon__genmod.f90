        !COMPILER-GENERATED INTERFACE MODULE: Tue Apr 23 23:08:20 2024
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE REDUCEDROW_ECHELON__genmod
          INTERFACE 
            FUNCTION REDUCEDROW_ECHELON(MATRIX)
              REAL(KIND=8), INTENT(IN) :: MATRIX(:,:)
              REAL(KIND=8) :: REDUCEDROW_ECHELON(SIZE(MATRIX,1),SIZE(   &
     &MATRIX,2))
            END FUNCTION REDUCEDROW_ECHELON
          END INTERFACE 
        END MODULE REDUCEDROW_ECHELON__genmod
