       !MS$ NOFREEFORM
       !MS$ FIXEDFORMLINESIZE:132 
       double precision function func_omega_d(o)
       implicit integer*4(i-n), real*8(a-h,o-z)
       include 'common.blk'  
c
c **** function to calculate shadow lagrangian (vd_t) and shadow wage (omega) based on equation (15) in documentation; leisure is set equal to one.
c
       a_numer = (assets_t*(one+r) + o - em)
       a_denom = ( o + (o/theta)**rho )
       func_omega_d = (a_numer/a_denom) - one
c
       return
	 end