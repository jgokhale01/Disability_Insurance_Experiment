       !MS$ NOFREEFORM
       !MS$ FIXEDFORMLINESIZE:132
       subroutine grid_vd_Tcap
       implicit integer*4(i-n), real*8(a-h,o-z)
       include 'common.blk'
       external func_omega_d
c
c **** write title line and blank line for debug printout       
       write (31,101) 
       call clear_scr_lines(31,1)
c
c **** initialize age and initial guess of shadow wage term vt_d [see documentation equations (11) and (15)]
c       
       jage = 120_4
       guess = 0.0015_8
c **** loop over grid points on assets brought into period t. 
       do 100 i = 1,1000
c **** initialize assets for this grid point (indexed by i)           
         assets_t = a(jage,i)
c **** initialize shadow wage lagrangian (vt_d) and calculate the shadow  wage based on it
         vt_d(jage,i) = zero
         omg = wage_rate * func_e(jage) + vt_d(jage,i)
c **** calculate the numerator and denominator terms and calculate l_star [equation (15)]         
         a_numer = (assets_t*(one+r) + omg - em)
         a_denom = (omg + (theta/omg)**(-rho))
         el =a_numer/a_denom
c **** subject the value of l_star to upper bound (time endowment = 1) and lower bound (leisure cannot be non-positive)         
         el_d(jage,i) = min(one, max(zero,el))
c **** if leisure equals zero, the asset level at this grid point is non-viable; omega stays at zero and other variables are set to null. 
         if (el_d(jage,i)==zero) then
           omega(jage,i) = omg
           vt_d(jage,i) = zero
           c_d(jage,i) = zero
           v_d(jage,i) = 1.0e-30
           go to 50
         endif
c **** if leisure=1, set it to one and calculate the shadow lagrangian (vt_d) and shadow wage value (omega) consistent with leisure=1  
         if (el_d(jage,i)==one) then 
           call calc_omega(jage,i,func_omega_d,guess,omg)
           guess = omg
           xcheck = func_omega_d(omg)
         endif
c **** if leisure is > 0 the above two conditional processing segments should yield the correct values for shadow variables omega and vt_d, and for consumption and the value function v_d. 
c **** Also set the viable_gridpoint flag to one.
         if (el_d(jage,i)>zero) then
           omega(jage,i) = omg
           vt_d(jage,i) = omega(jage,i) - wage_rate * func_e(jage)
           c_d(jage,i) = ((theta/omega(jage,i))**(-rho))*el_d(jage,i)
           v_d(jage,i) = -1.0e-30
           if (el>zero) v_d(jage,i) = func_u(c,el) 
           viable_gridpoint(jage,i) = one
         endif
c **** prepare and write variables to debug file
50          c = c_d(jage,i)
           el = el_d(jage,i)
           omg = wage_rate * func_e(jage) + vt_d(jage,i)
         wage = omg*(one-el)
         rinc = assets_t*r
         resources = (assets_t*(one+r) + wage + vt_d(jage,i))
         write (31,102) i,assets_t,rinc,wage,vt_d(jage,i),resources,el_d(jage,i),c_d(jage,i),viable_gridpoint(jage,i)
c **** end loop over current grid point
100    continue
c
101    format ('SER_NO ','ASSETS ',' R-INC ',' WAGES ','  VT_D ',' RESRCS ',' LEISR ',' CONS  ','VIABLE')
102    format (i5,1x,8(f6.3,1x))
c
       return
	 end