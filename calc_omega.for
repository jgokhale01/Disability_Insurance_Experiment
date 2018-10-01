       !MS$ NOFREEFORM
       !MS$ FIXEDFORMLINESIZE:132 
       subroutine calc_omega(j,i,func_omega_d,guess,o)
       USE ZREAL_INT
       USE WRRRN_INT
       implicit integer*4(i-n), real*8(a-h,o-z)
c
       PARAMETER (NROOT=1)
       INTEGER*4 itmax
       REAL*8 eps, errabs, errrel, func_omega_d, x(NROOT), xguess(NROOT)
       EXTERNAL func_omega_d       
c
       eps = 1.0E-5_8
       errabs = 1.0E-5_8
       errrel = 1.0E-5_8
       itmax = 30
       xguess = guess
c
       CALL D_ZREAL (func_omega_d, x, errabs=errabs, errrel=errrel, eps=eps, nroot=nroot, xguess=xguess)
       o = x(1)
c
       return
	 end