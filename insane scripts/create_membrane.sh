pip install --force-reinstall --no-deps simopt git+https://github.com/Tsjerk/Insane.git
wget https://cgmartini-library.s3.ca-central-1.amazonaws.com/1_Downloads/ff_parameters/martini3/martini_v300.zip
unzip martini_v300.zip -x __MACOSX/* */.DS_Store
cp martini_v300/martini_v3.0.0.itp martini_v300/martini_v3.0.0_ions_v1.itp martini_v300/martini_v3.0.0_solvents_v1.itp .
wget https://github.com/Martini-Force-Field-Initiative/M3-Lipid-Parameters/raw/refs/heads/main/ITPs/martini_v3.0.0_ffbonded_v2.itp
wget https://github.com/Martini-Force-Field-Initiative/M3-Lipid-Parameters/raw/refs/heads/main/ITPs/martini_v3.0.0_phospholipids_PC_v2.itp
insane -salt 0.15 -x 20 -y 10 -z 10 -sol W -o membrane.gro -l DPPC:90:84 -l DUPC:78:73 -l CHOL:56:56 -l PIP2:0:11 -p topol.top
