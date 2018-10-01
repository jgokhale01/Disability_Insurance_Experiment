       !MS$ NOFREEFORM
       !MS$ FIXEDFORMLINESIZE:132 
       double precision function func_e(j)
       implicit integer*4(i-n), real*8(a-h,o-z)
       include 'common.blk'  
c
c **** See Excel spreadsheet 
c
       func_e = dmax1(zero,
     *                     0.1500000_8*(a_j)** zero +
     *                     0.0500000_8*(a_j)**  one + 
     *                     0.0001000_8*(a_j)**  two +
     *                     0.0000220_8*(a_j)**three )
c       
       return
	 end