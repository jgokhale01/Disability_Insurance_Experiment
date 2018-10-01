       !MS$ NOFREEFORM
       !MS$ FIXEDFORMLINESIZE:132 
       subroutine branch_v_d
       implicit integer*4(i-n), real*8(a-h,o-z)
       include 'common.blk'  
c
c **** Call routine for calculating consumption/leisure functions in the last possible period of life, T
c
       call grid_vd_Tcap
c
c **** Call routine for calculating consumption/leisure functions in lifecycle periods t<T
c
       do 10 jage = 119,20,-1
         call grid_vd_t
10     continue
c
       return
	 end