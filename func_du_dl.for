       !MS$ NOFREEFORM
       !MS$ FIXEDFORMLINESIZE:132 
       double precision function func_du_dl(c,el)
       implicit integer*4(i-n), real*8(a-h,o-z)
       include 'common.blk'  
c
       rho_term = (one - (one/rho))
c       
       c_term =          c**rho_term
       el_term = theta*(el**rho_term)
c       
       phi = (c_term + el_term)**((one/rho_term)-one)
       
       func_du_dl = phi*theta*(el**(-one/rho))
c
       return
	 end