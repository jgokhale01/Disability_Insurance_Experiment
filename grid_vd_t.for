       !MS$ NOFREEFORM
       !MS$ FIXEDFORMLINESIZE:132 
       subroutine grid_vd_t
       implicit integer*4(i-n), real*8(a-h,o-z)
       include 'common.blk'  
       external func_value_d
c
c **** loop over initial assets grid indexed by i
c
       do 100 i = 1,1000
c **** set initial assets for period t           
         assets_t = a(jage,i)
c
c **** check viability under condition that leisure = 0
c
c **** evaluate if asset_tplus1 under zero leisure [1-e1=1, hence the term (1-el) does not multiply omg below] is within viable grid region for the next period 
         vt_d(jage,i) = zero
         omg = (wage_rate * func_e(jage) + vt_d(jage,i))
c
         assets_tplus1 = (assets_t*(one+r) + omg - em)
         ipos1 = max0(0_4, idint(assets_tplus1/grid_step))
         if (viable_gridpoint(jage+1,ipos1)<one) go to 100
c **** if viable proceed...
         viable_gridpoint(jage,i) = one
         vt_d(jage,i) = zero
c **** initialize omega with the lagrangian term for leisure=1 set to zero
         omg = wage_rate * func_e(jage) + vt_d(jage,i)
         guess_c  = 1.0e-6_8
         guess_el = 1.0e-0_8
         call calc_vd_t(func_value_d,guess_c,guess_el)
         c_d(jage,i) = guess_c
         el_d(jage,i) = guess_el
         v_d(jage,i) = func_u(guess_c,guess_el)
100    continue
c
       return
	 end