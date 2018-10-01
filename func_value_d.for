       !MS$ NOFREEFORM
       !MS$ FIXEDFORMLINESIZE:132 
       subroutine func_value_d(x,f,n)
       implicit integer*4(i-n), real*8(a-h,o-z)
       include 'common.blk' 
c
       dimension x(n), f(n)
c
        c = x(1)
       el = x(2)
c **** calculate the value function under the current guess of c and el (interpolate the value function based on bracketing grid points for assets in the next period).
       assets_tplus1 = (assets_t*(one-r) + omg*(one-el) - em - c)
       ipos1 = idint(assets_tplus1/grid_step)
       diff = assets_tplus1 - dflotj(ipos1)*grid_step
       v_tplus1 = dflotj(ipos1+1)*grid_step*diff + assets_tplus1*(one-diff)
c
       c1 = c + delta_c
c
c **** calculate the value function under a small deviation of consumption (interpolate the value function based on bracketing grid points for assets in the next period).
       assets_tplus1 = (assets_t*(one-r) + omg*(one-el) - em - c1)
       ipos1 = idint(assets_tplus1/grid_step)
       diff = assets_tplus1 - dflotj(ipos1)*grid_step
       v_tplus1_dc = dflotj(ipos1+1)*grid_step*diff + assets_tplus1*(one-diff)
c **** calculate the f.o.c. based on consumption [(equation (16)]
       f(1) = func_du_dc(c,el) + beta*s(jage)*((v_tplus1_dc-v_tplus1)/delta_c)
c
       el1 = el + delta_el
c
c **** calculate the value function under a small deviation of leisure (interpolate the value function based on bracketing grid points for assets in the next period).
       assets_tplus1 = (assets_t*(one-r) + omg*(one-el1) - em - c)
       ipos1 = idint(assets_tplus1/grid_step)
       diff = assets_tplus1 - dflotj(ipos1)*grid_step
       v_tplus1_del = dflotj(ipos1+1)*grid_step*diff + assets_tplus1*(one-diff)
c **** calculate the f.o.c. based on consumption [(equation (17)]
       f(2) = func_du_dl(c,el) + beta*s(jage)*((v_tplus1_del-v_tplus1)/delta_c)
c
       return
	 end