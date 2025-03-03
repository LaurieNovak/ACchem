      SUBROUTINE Update_LWC()

      IMPLICIT NONE
      INCLUDE 'KPP_ROOT_Parameters.h'
      INCLUDE 'KPP_ROOT_Global.h'

      KPP_REAL Cloudstart, Cloudend
      KPP_REAL Thour, Tlocal, Ttmp, PI
      PARAMETER (PI = 3.14159265358979d0) 
   
      Cloudstart = 11.5
      Cloudend  = 12.5
      Thour = TIME/3600.
      Tlocal = Thour - (INT(Thour)/24)*24

      IF ((Tlocal.GE.Cloudstart).AND.(Tlocal.LE.Cloudend)) THEN
        Ttmp = (2.0*Tlocal-Cloudstart-Cloudend)/(Cloudend-Cloudstart)
        IF (Ttmp.GT.0) THEN
          Ttmp =  Ttmp*Ttmp
        ELSE
          Ttmp = -Ttmp*Ttmp
        END IF
        LWC = 0.3E-6 
      ELSE
        LWC = 0.0
      END IF

      RETURN
      END

