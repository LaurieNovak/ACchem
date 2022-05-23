!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!
!    Forward Euler method for non-stiff ODEs                              !
!                                                                         !
!    Version History:                                                     !
!    Apr. 30, 2022 - Initial Version - M.S.Long                           !
!                                                                         !
!    This implementation is part of KPP - the Kinetic PreProcessor        !
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!
MODULE KPP_ROOT_Integrator

  USE KPP_ROOT_Precision, ONLY: dp
  USE KPP_ROOT_Parameters, ONLY: NVAR, NFIX, NSPEC
  USE KPP_ROOT_Global
  USE KPP_ROOT_Monitor
  IMPLICIT NONE
  PUBLIC
  SAVE

  ! description of the error numbers IERR
  CHARACTER(LEN=50), PARAMETER, DIMENSION(1) :: IERR_NAMES = (/ &
    'dummy value                                       ' /)

CONTAINS

  ! **************************************************************************

  SUBROUTINE INTEGRATE( TIN, TOUT, ICNTRL_U, IERR_U )
    IMPLICIT NONE
    
    KPP_REAL, INTENT(IN) :: TIN  ! Start Time
    KPP_REAL, INTENT(IN) :: TOUT ! End Time
    ! Optional input parameters and statistics
    INTEGER,       INTENT(IN),  OPTIONAL :: ICNTRL_U(20)
    INTEGER,       INTENT(OUT), OPTIONAL :: IERR_U
    ! Local variables
    INTEGER                              :: ICNTRL(20)
    INTEGER                              :: IERR

    ! ICNTRL(16)
    ! 0 -> do nothing.
    ! 1 -> set negative values to zero
    ! 2 -> return with error code
    ! 3 -> stop at negative
    !
    ! ICNTRL(17) = verbose error output

    !~~~> Zero input and output arrays for safety's sake
    ICNTRL     = 0

    IF ( PRESENT( ICNTRL_U ) ) THEN
       WHERE( ICNTRL_U /= 0 ) ICNTRL = ICNTRL_U
    ENDIF

    CALL FORWARDEULER(NVAR,VAR,TIN,TOUT,ICNTRL,IERR)

    IF ( PRESENT( IERR_U ) ) IERR_U  = IERR

  END SUBROUTINE INTEGRATE

  SUBROUTINE FORWARDEULER(N,Y,Tstart,Tend,ICNTRL,IERR)

    ! Input: Arguments
    KPP_REAL, INTENT(INOUT) :: Y(N) ! initial condition
    INTEGER,  INTENT(IN)    :: N
    KPP_REAL, INTENT(IN)    :: Tstart,Tend
    INTEGER,  INTENT(IN)    :: ICNTRL(20)
    ! Output: 
    INTEGER, INTENT(OUT)    :: IERR ! Error indicator
    ! Local variables
    INTEGER  :: i
    LOGICAL  :: hasNegative
    KPP_REAL :: Ynew(N), dYdt(N)

    !
    hasNegative = .false.
    
    ! Get P-kY
    CALL FunTEMPLATE( Y, dYdt )

    ! Integrate
    Ynew = Y+dYdt*(Tend-Tstart)

    ! Check for negatives
    IF (ICNTRL(16) .gt. 0) THEN ! Don't perform DO() loop if you don't care
       DO i=1,N
          IF (Ynew(i) .lt. 0._dp) THEN
             hasNegative = .true.
             IF (ICNTRL(17) /= 0) write(*,*) trim(SPC_NAMES(i)), " is negative."
             IERR = -9
             IF (ICNTRL(16) == 1) THEN
                Ynew(i) = 0._dp
             ELSE IF (ICNTRL(16) == 2) THEN
                write(*,*) '(ICNTRL(16) = 2) Negative value. Returning.'
                RETURN
             ELSE IF (ICNTRL(16) == 3) THEN
                write(*,*) '(ICNTRL(16) = 3) Negative value. Stopping.'
                STOP
             ENDIF
          ENDIF
       ENDDO
    ENDIF

    Y = Ynew

    ! Succesful exit
    IERR = 1
    
  END SUBROUTINE FORWARDEULER

  !~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  SUBROUTINE FunTemplate( Y, Ydot )
    !~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    !  Template for the ODE function call.
    !~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    USE KPP_ROOT_Parameters, ONLY: NVAR
    USE KPP_ROOT_Global,     ONLY: FIX, RCONST
    USE KPP_ROOT_Function,   ONLY: Fun
    
    !~~~> Input variables
    KPP_REAL :: Y(NVAR)
    !~~~> Output variables
    KPP_REAL :: Ydot(NVAR)

    CALL Fun( Y, FIX, RCONST, Ydot )

  END SUBROUTINE FunTemplate

END MODULE KPP_ROOT_Integrator
