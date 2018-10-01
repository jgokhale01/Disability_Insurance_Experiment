       !MS$ NOFREEFORM
       !MS$ FIXEDFORMLINESIZE:132
       subroutine read_parm_files
       implicit integer*4(i-n), real*8(a-h,o-z)
       include 'common.blk' 
c
       character*6 char6
c
       read (21,102) it, char6, (dm_mat(j),j=1,120)
       read (21,102) it, char6, (df_mat(j),j=1,120)
c
101    format (10f10.6)
102    format (i4,1x,a6,1x,120(f8.6,1x))
c
       return
       end
