void Update_LWC()
{
KPP_REAL Cloudstart, Cloudend;
KPP_REAL Thour, Tlocal, Ttmp; 
const KPP_REAL PI = 3.14159265358979;  

  Cloudstart = 11.5;
  Cloudend  = 12.5;
  Thour = TIME/3600.0;
  Tlocal = Thour - ((int)Thour/24)*24;

  if ( (Tlocal >= Cloudstart) && (Tlocal <= Cloudend) ) {
    Ttmp = (2.0*Tlocal-Cloudstart-Cloudend)/(Cloudend-Cloudstart);
    if (Ttmp > 0) Ttmp =  Ttmp*Ttmp;
             else Ttmp = -Ttmp*Ttmp;
    LWC = 0.3E-6; 
  } else {
    LWC=0.0;
  }
}
