#INCLUDE atoms.kpp

#DEFVAR
{O}
Og   = O;                       { Oxygen atomic ground state }
O1Dg = O;                       { Oxygen atomic excited state }
O3g  = O + O + O;               { Ozone }
{H}
OHg = O + H;                    { Hydroxyl radical }
HO2g = H + O + O;               { Hydroperoxyl radical }
H2O2g = H + H + O + O;                  { Hydrogen peroxide }
{N}
NOg  = N + O;                   { Nitric oxide }
NO2g = N + O + O;               { Nitrogen dioxide }
NO3g = N + O + O + O;           { Nitrogen trioxide }
N2O5g = N + N + O + O + O + O + O;  { Dinitrogen pentoxyd }
HNO3g = H + N + O + O + O;      { Nitric acid }
HONOg = H + O + N + O;                  { Nitrous acid }
HO2NO2g = H + O + O + N + O + O; { Peroxynitric acid }
{C}
COg = C + O;                    { Carbon monoxide }
CH3OOg = C + 3H + O + O;                { Methyl peroxy }
CH2Og = C + 2H + O;             { Formaldehyde }
CH3OOHg = C + 3H + O + O + H;   { Acetic Acid }
HCOOHg = H + C + O + O + H;     { Formic Acid }
CO2g = C + 2O;
CH4g = C + 4H;

{Aqeous-Phase}
O3aq = 3O;
H2O2aq = 2H + 2O;
OHaq = O + H;
HO2aq = H + 2O;
CH3OOaq = C + 3H + 2O;
CH3OOHaq = C + 3H + 2O + H;
CHOHOHaq = C + H + 2O + 2H;
HCOOHaq = H + C + 2 O + H;
NOaq = N + O;
NO2aq = N + 2O;
HNO3aq = H + N + 3O;
NO3aq = N + 3O;
CO2aq = C + 2O;
Claq = Cl;
Cl2aq = 2Cl;
O2aq = 2O;
CH2OHOHaq = C + 2H + 2O + 2H;

{Ions}
HO2m = H + 2O;                  { HO2- }
O2m = 2O;                       { O2- }
HCOOm = H + C + 2O;             { HCOO- }
NO3m = N + 3O;                  { NO3- }
HCO3m = H + C + 3O;             { HCO3- }
CO3m = C + 3O;                  { CO3- }
Cl2m = 2Cl;                     { Cl2- }
Clm = Cl;                       { Cl- }
OHm = O + H;                    { OH- }

#DEFFIX
Hp = H;
