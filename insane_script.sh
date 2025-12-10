insane -o PIP2_WO.gro -p PIP2_WO.top -x 12 -y 12 -z 10 -pbc rectangular -u DPPC:90 -u M2.DIPC:78 -u CHOL:56 -l DPPC:84 -l M2.DIPC:73 -l CHOL:56 -sol W


insane -o PIP2.gro -p PIP2.top -x 12 -y 12 -z 10 -pbc rectangular -u M2.DPPC:90 -u M2.DIPC:78 -u M2.CHOL:56 -l M2.DPPC:84 -l M2.DIPC:73 -l M2.CHOL:56 -l M2.POP2:11 -sol W -neutral -salt 0.15

#include "martini_v2.2.itp"
#include "martini_v2.0_CHOL_02.itp"
#include "martini_v2.0_DIPC_01.itp"
#include "martini_v2.0_DPPC_01.itp"
#include "martini_v2.0_POP2_01.itp"
#include "martini_v2.0_ions.itp"



# Energy Minimization
gmx grompp -f minim.mdp -o minimize.tpr -p PIP2.top -c PIP2.gro -maxwarn 2
gmx mdrun -s minimize.tpr -o minimized_PIP2.gro 

# Equilibration NVT
gmx grompp -f npt.mdp -p PIP2.top -c minimized_PIP2.gro -o run.tpr -maxwarn 2
gmx mdrun -s run.tpr -o PIP2_100.trr -x PIP2_100.xtc                                

# RDF 
gmx make_ndx -f PIP2.gro -o index.ndx
# Select groups for RDF calculation
r CHOL
name 8 CHOL_all 
r POP2
name 9 POP2_all 
r DPPC
name 10 DPPC_all
r DIPC 
name 11 DIPC_all
q 

gmx rdf -f PIP2_100.xtc -s ../minimized_PIP2.gro -n ../index.ndx -ref DPPC -sel POP2 -selrpos res_com -seltype res_com -o rdf_DPPC_POP2.xvg


# Inspect each frame 
gmx trjconv -f trajectory/PIP2_100.xtc -s run.tpr -o frame1.gro -dump 1