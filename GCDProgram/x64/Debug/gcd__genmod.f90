        !COMPILER-GENERATED INTERFACE MODULE: Tue Apr 23 23:01:13 2024
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE GCD__genmod
          INTERFACE 
            RECURSIVE FUNCTION GCD(A,B) RESULT(X)
              REAL(KIND=4), INTENT(IN) :: A
              REAL(KIND=4), INTENT(IN) :: B
              REAL(KIND=4) :: X
            END FUNCTION GCD
          END INTERFACE 
        END MODULE GCD__genmod
