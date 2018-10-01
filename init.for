       !MS$ NOFREEFORM
       !MS$ FIXEDFORMLINESIZE:132 
       subroutine init
       implicit integer*4(i-n), real*8(a-h,o-z)
       include 'common.blk'  
c
       zero = 0.0_8
       one  = 1.0_8
       two  = 2.0_8
       three= 3.0_8
c
       i_sec = 0_4
       i_min = 0_4
       i_hrs = 0_4
       i_day = 0_4
c
       s = zero
       p = zero
       j_disab_onset = 51_4
c
       grid_step = 0.01_8
       delta_c = 1.0e-08
       delta_el= 1.0e-08
c       
       do 10 j = 0,120
         s(j) = one - dm_mat(j)
         if (j>=j_disab_onset) p(j) = grid_step
10     continue
c
       r = 0.02_8
       em = 0.2_8
       wage_rate = one
c       
       rho = 0.8_8
       gamma = 0.25_8
       theta = 1.5_8
       beta = one/(one + 0.015_8)
c
       vt_d    = zero
       lamda_d = zero
       mu_d    = zero
       viable_gridpoint  = zero
       
       do 30 j = 20,120
         do 20 i = 0,1000
           a(j,i) = dflotj(i)/100.0_8
20       continue
30     continue
c
       return
	 end