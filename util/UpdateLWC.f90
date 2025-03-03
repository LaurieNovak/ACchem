  SUBROUTINE Update_LWC()
    USE KPP_ROOT_Parameters
    USE KPP_ROOT_Global

    IMPLICIT NONE

    KPP_REAL :: Cloudstart, Cloudend
    KPP_REAL :: Thour, Tlocal, Ttmp 
    ! PI - Value of pi
    KPP_REAL, PARAMETER :: PI = 3.14159265358979d0
    
    Cloudstart = 11.5_dp 
    Cloudend  = 12.5_dp 
    Thour = TIME/3600.0_dp 
    Tlocal = Thour - (INT(Thour)/24)*24

    IF ((Tlocal>=Cloudstart).AND.(Tlocal<=Cloudend)) THEN
       Ttmp = (2.0*Tlocal-Cloudstart-Cloudend)/(Cloudend-Cloudstart)
       IF (Ttmp.GT.0) THEN
          Ttmp =  Ttmp*Ttmp
       ELSE
          Ttmp = -Ttmp*Ttmp
       END IF
       LWC = 0.3E-6_dp 
    ELSE
       LWC = 0.0_dp 
    END IF

 END SUBROUTINE Update_LWC

