#INCLUDE atoms.kpp

#DEFVAR
{O}
Og   = O;	  		{ Oxygen atomic ground state }
O1Dg = O;  			{ Oxygen atomic excited state }
O3g  = O + O + O;  		{ Ozone }
{H}
OHg = O + H;  			{ Hydroxyl radical }
HO2g = H + O + O;  		{ Hydroperoxyl radical }
H2O2g = H + H + O + O;  		{ Hydrogen peroxide }
{N}
NOg  = N + O;  			{ Nitric oxide }     
NO2g = N + O + O;  		{ Nitrogen dioxide }
NO3g = N + O + O + O;  		{ Nitrogen trioxide }
N2O5g = N + N + O + O + O + O + O;  { Dinitrogen pentoxyd }
HNO3g = H + N + O + O + O;  	{ Nitric acid }
HONOg = H + O + N + O;  		{ Nitrous acid }
HO2NO2g = H + O + O + N + O + O; { Peroxynitric acid }
{C}
COg = C + O; 		 	{ Carbon monoxide }
CH3OOg = C + 3H + O + O;		{ Methyl peroxy }		
CH2Og = C + 2H + O;		{ Formaldehyde }
CH3OOHg = C + 3H + O + O + H;	{ Acetic Acid }
HCOOHg = H + C + O + O + H;	{ Formic Acid }
CO2g = C + 2O;
CH4g = C + 4H;

#DEFFIX
M = IGNORE;			{ Atmospheric generic molecule }
O2g = O + O;			{ Molecular Oxygen }
//CH4g =  C + 4H;			{ Methane }
DUMMY = IGNORE;
H2Og = 2H + O;			{ Water }
H2g = 2H;			{ Molecular hydrogen }
//CO2g = C + 2O; 			{ Carbon Dioxide }
