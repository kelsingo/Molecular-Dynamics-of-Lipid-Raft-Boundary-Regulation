insane -o PIP2_WO.gro -p PIP2_WO.top -x 12 -y 12 -z 10 -pbc rectangular -u DPPC:90 -u M2.DIPC:78 -u CHOL:56 -l DPPC:84 -l M2.DIPC:73 -l CHOL:56 -sol W


# Add these lines to the top of PIP2_WO.top file
# ----------------------------------------------

#include "martini_v2.2.itp"
#include "martini_v2.0_CHOL_02.itp"
#include "martini_v2.0_DIPC_01.itp"
#include "martini_v2.0_DPPC_01.itp"

# Energy Minimization
gmx grompp -f minim.mdp -o minimize.tpr -p PIP2_WO.top -c PIP2_WO.gro -maxwarn 2
gmx mdrun -s minimize.tpr -o minimized_PIP2.gro 

# Equilibration NVT 
gmx grompp -f npt.mdp -p PIP2_WO.top -c minimized_PIP2_WO.gro -o run.tpr -maxwarn 2
gmx mdrun -s run.tpr -o PIP2_WO_100.trr -x PIP2__WO_100.xtc  

# Equilibration NVT -> Current run takes sample every 100 steps, to change to 1000 steps modify -nstxout = 100 in npt.mdp file, then rerun these commands
gmx grompp -f npt.mdp -p PIP2_WO.top -c minimized_PIP2_WO.gro -o run.tpr -maxwarn 2
gmx mdrun -s run.tpr -o PIP2_WO_1000.trr -x PIP2__WO_100.xtc                                


# RDF 
gmx make_ndx -f PIP2_WO.gro -o index.ndx
# Select groups for RDF calculation
r CHOL
name 8 CHOL_all 
r DPPC
name 10 DPPC_all
r DIPC 
name 11 DIPC_all
q 

gmx rdf -f PIP2_WO_100.xtc -s ../minimized_PIP2_WO.gro -n ../index.ndx -ref CHOL_all -sel DIPC_all -selrpos res_com -seltype res_com -o rdf_DPPC_CHOL.xvg
gmx rdf -f PIP2_WO_100.xtc -s ../minimized_PIP2_WO.gro -n ../index.ndx -ref CHOL_all -sel DPPC_all -selrpos res_com -seltype res_com -o rdf_DPPC_CHOL.xvg

