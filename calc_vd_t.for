       !MS$ NOFREEFORM
       !MS$ FIXEDFORMLINESIZE:132 
       subroutine calc_vd_t(func_value_d,c,el)
       USE NEQNF_INT
       USE UMACH_INT
       implicit integer*4(i-n), real*8(a-h,o-z)
       include 'common.blk'  
c
       PARAMETER (N=2_4)
       INTEGER*4 itmax
       REAL*8 fnorm, x(N), xguess(N)
       EXTERNAL func_value_d       
c
       xguess(1) = c
       xguess(2) = el
c
       CALL D_NEQNF(func_value_d, x, xguess=xguess, fnorm=fnorm)
c       
       c  = x(1)
       el = x(2)
c
       return
	 end