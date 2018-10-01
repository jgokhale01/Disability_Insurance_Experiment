       !MS$ NOFREEFORM
       !MS$ FIXEDFORMLINESIZE:132
       subroutine openfiles
       implicit integer*4(i-n), real*8(a-h,o-z)
       include 'common.blk' 
c
       open (21,file='D:\FortHome\Disability_Experiment\io\dm_df.txt')
c       
       open (31,file='D:\FortHome\Disability_Experiment\io\debug.txt')
c
200    return
       end