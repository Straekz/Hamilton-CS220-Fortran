        !COMPILER-GENERATED INTERFACE MODULE: Tue Apr 23 20:55:22 2024
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE REDUCEDROW_ECHELON__genmod
          INTERFACE 
            FUNCTION REDUCEDROW_ECHELON(MATRIX)
              REAL(KIND=4), INTENT(IN) :: MATRIX(:,:)
              REAL(KIND=4) :: REDUCEDROW_ECHELON(SIZE(MATRIX,1),SIZE(   &
     &MATRIX,2))
            END FUNCTION REDUCEDROW_ECHELON
          END INTERFACE 
        END MODULE REDUCEDROW_ECHELON__genmod
