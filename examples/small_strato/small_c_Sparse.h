// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// 
// Sparse Data Header File
// 
// Generated by KPP-3.1.0 symbolic chemistry Kinetics PreProcessor
//       (https:/github.com/KineticPreProcessor/KPP
// KPP is distributed under GPL, the general public licence
//       (http://www.gnu.org/copyleft/gpl.html)
// (C) 1995-1997, V. Damian & A. Sandu, CGRER, Univ. Iowa
// (C) 1997-2022, A. Sandu, Michigan Tech, Virginia Tech
//     With important contributions from:
//        M. Damian,   Villanova University, Philadelphia, PA, USA
//        R. Sander,   Max-Planck Institute for Chemistry, Mainz, Germany
//        M. Long,     Renaissance Fiber, LLC, North Carolina, USA
//        H. Lin,      Harvard University, Cambridge, MA, USA
//        R. Yantosca, Harvard University, Cambridge, MA, USA
// 
// File                 : small_c_Sparse.h
// Equation file        : small_c.kpp
// Output root filename : small_c
// 
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~




//  ----------> Sparse Jacobian Data

extern int LU_IROW[LU_NONZERO];                 /* Row indexes of the LU Jacobian of variables */
extern int LU_ICOL[LU_NONZERO];                 /* Column indexes of the LU Jacobian of variables */
extern int LU_CROW[CNVAR];                      /* Compressed row indexes of the LU Jacobian of variables */
extern int LU_DIAG[CNVAR];                      /* Diagonal indexes of the LU Jacobian of variables */


//  ----------> Sparse Hessian Data

extern int IHESS_I[NHESS];                      /* Index i of Hessian element d^2 f_i/dv_j.dv_k */
extern int IHESS_J[NHESS];                      /* Index j of Hessian element d^2 f_i/dv_j.dv_k */
extern int IHESS_K[NHESS];                      /* Index k of Hessian element d^2 f_i/dv_j.dv_k */


//  ----------> Sparse Stoichiometric Matrix

extern double STOICM[NSTOICM];                  /* Stoichiometric Matrix in compressed column format */
extern int IROW_STOICM[NSTOICM];                /* Row indices in STOICM */
extern int CCOL_STOICM[CNEQN];                  /* Beginning of columns in STOICM */
extern int ICOL_STOICM[NSTOICM];                /* Column indices in STOICM */


//  ----------> Sparse Data for Jacobian of Reactant Products

extern int ICOL_JVRP[NJVRP];                    /* Column indices in JVRP */
extern int IROW_JVRP[NJVRP];                    /* Row indices in JVRP */
extern int CROW_JVRP[CNEQN];                    /* Beginning of rows in JVRP */

