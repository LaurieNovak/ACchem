function Update_LWC( )

global TIME LWC
 
   Cloudstart = 11.5;
   Cloudend  = 12.5;
   Thour = TIME/3600.;
   Tlocal = Thour - floor(Thour/24)*24;

   if ( (Tlocal>=Cloudstart) & (Tlocal<=Cloudend) ) 
     Ttmp = (2.0*Tlocal-Cloudstart-Cloudend)/(Cloudend-Cloudstart);
     if (Ttmp>0) 
       Ttmp =  Ttmp*Ttmp;
     else
       Ttmp = -Ttmp*Ttmp;
     end 
     LWC = 0.3E-6 ;
   else
     LWC = 0.0;
   end 

return % Update_LWC

