       !MS$ NOFREEFORM
       !MS$ FIXEDFORMLINESIZE:132
       subroutine clear_scr_lines(iunt,nn)
       implicit integer*4(i-n), real*8(a-h,o-z)
       include 'common.blk' 
c  
       do 10 k = 1,nn
	   write (iunt,*) ' '
10     continue
c
       return 
	 end