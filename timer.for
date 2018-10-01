       !MS$ NOFREEFORM
       !MS$ FIXEDFORMLINESIZE:132
	 subroutine timer(k)
       use dfport    
	 use dflib
       implicit integer*4(i-n), real*8(a-h,o-z)
       include 'common.blk'
c 
c **** SUBROUTINE TO CONSTRUCT INITIAL SEED FOR RANDOM NUMBER GENERATION
c
       integer*4 stime, timearr(9)  
    
       stime = time()                  ! Initialize stime to number of seconds since 00:00:00 GMT January 1, 1970
c
       if (k==1_4) then
         CALL GETDAT(i_y, i_m, i_d)
         CALL GETTIM(i_h, i_m, i_s, i_h)
         iseed = i_d*i_m*i_h/i_d*i_m*i_s*i_h
         randnum = drand(iseed)
       endif
 
10     CALL GMTIME (stime, timearr)
c
       i_sec(k) = timearr(1)
	 i_min(k) = timearr(2)
	 i_hrs(k) = timearr(3)
	 i_day(k) = timearr(4)
c
       if (k==1_4) return
c
       if (k==2_4) then
	   i_sec(3) = i_sec(2) - i_sec(1)
	   i_min(3) = i_min(2) - i_min(1)
	   i_hrs(3) = i_hrs(2) - i_hrs(1)
	   i_day(3) = i_day(2) - i_day(1)
       endif
c
       if (i_hrs(3)<0) then 
	   i_day(3) = i_day(3) - 1_4
	   i_hrs(3) = i_hrs(3) + 23_4
       endif
c
       if (i_min(3)<0) then 
	   i_hrs(3) = i_hrs(3) - 1_4
	   i_min(3) = i_min(3) + 59_4
       endif
c
       if (i_sec(3)<0) then 
	   i_min(3) = i_min(3) - 1_4
	   i_sec(3) = i_sec(3) + 59_4
       endif
c	 
       return
       end