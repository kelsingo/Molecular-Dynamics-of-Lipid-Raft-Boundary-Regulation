# Molecular Simulations of Lipid Microdomains for the Structural Preference of PIP2 Lipid

## Overview

This project investigates the localization of **phosphatidylinositol 4,5-bisphosphate (PIP₂)** within raft-forming lipid membranes using **coarse-grained molecular dynamics (CG-MD)** simulations performed in **GROMACS** with the **MARTINI force field**.

Cell membranes comprise several microdomains that play essential roles in signaling and molecular interactions. Lipid rafts, among the microdomains of lipid bilayers, provide ordered environments, less fluid structure that influence the recruitment of proteins and other cellular activities. Looking into the lipid raft structure, PIP2 lipid (phosphatidylinositol 4,5-bisphosphate) has been shown to play an important position in transmembrane signaling. However, both PIP2’s potential localization to lipid rafts and the degree to which its signaling is raft-mediated remain unresolved.

Using CG-MD, this project simulate a mixed lipid bilayer and examine the structural preference of PIP2 within microdomains through quantitative molecular dynamics analyses, including **Potential Energy (PE)**, **Radial Distribution Functions (RDF)**, and **Mean Squared Displacement (MSD)**. Results revealed that PIP2 prefers the lipid raft domains containing DPPC (dipalmitoylphosphatidylcholine) and CHOL (cholesterol). 

> **Course Project:** Introduction to Molecular Simulations

## Project Objectives

- Construct an asymmetric raft-forming lipid bilayer containing PIP₂
- Simulate membrane equilibration using coarse-grained molecular dynamics
- Characterize membrane stability during equilibration
- Quantify interactions between PIP₂ and surrounding lipid species
- Investigate whether PIP₂ preferentially associates with raft-like membrane environments

---

## Membrane Composition

### Outer Leaflet

| Lipid | Count | Percentage |
|-------|------|------:|
| DIPC | 78 | 35% |
| DPPC | 90 | 40% |
| CHOL | 56 | 25% |

### Inner Leaflet

| Lipid | Count | Percentage |
|-------|------|------:|
| DIPC | 73 | 32.5% | 
| DPPC | 84 | 37.5% |
| CHOL | 56 | 25% | 
| PIP₂ | 11 | 5% |

Simulation box dimensions:

```
12 × 12 × 10 nm
```

---

## Simulation Workflow

```text
Build asymmetric membrane
            │
            ▼
Energy minimization
            │
            ▼
10 ns NPT equilibration
            │
            ▼
Trajectory generation
            │
            ▼
Quantitative analysis
```

### Simulation Parameters

| Parameter | Value |
|-----------|-------|
| Force Field | MARTINI Coarse-Grained |
| Ensemble | NPT |
| Temperature | 295 K |
| Time Step | 0.02 ps |
| Simulation Length | 2 ns |

---

## Analysis

### Potential Energy

Potential energy was monitored throughout equilibration to evaluate system stability and determine whether the membrane reached equilibrium.

---

### Radial Distribution Function (RDF)

Radial distribution functions were computed between PIP₂ and surrounding membrane lipids:

- DIPC
- DPPC
- CHOL

RDF analysis quantifies the probability of finding each lipid species around PIP₂ relative to a random distribution.

---

### Mean Squared Displacement (MSD)

Mean squared displacement was calculated to evaluate lateral diffusion of:

- DIPC
- DPPC
- CHOL
- PIP₂

MSD provides insight into membrane mobility and lipid diffusion behaviour.

---

## Results

### Stable Membrane Formation

- The lipid bilayer remained structurally stable throughout equilibration.
- Water molecules remained outside the hydrophobic membrane core.
- Potential energy rapidly decreased before reaching a stable plateau, indicating successful equilibration.

---

### PIP₂ Preferentially Associates with Raft Components

Radial distribution function analysis shows stronger interactions between **PIP₂**, **DPPC**, and **cholesterol** than between **PIP₂** and **DIPC**.

Although liquid-ordered and liquid-disordered domains could not be explicitly identified, these interaction patterns suggest that PIP₂ preferentially associates with **raft-like membrane environments**, consistent with previous computational studies.

---

### Lipid Diffusion

Mean squared displacement analysis indicates:

- Similar diffusion rates for DIPC and DPPC
- Higher diffusion of cholesterol compared to phospholipids

The higher cholesterol mobility agrees with previous molecular dynamics studies and supports the validity of the simulation.

---

## Key Skills Demonstrated

- Molecular Dynamics Simulation
- Coarse-Grained Modeling
- GROMACS
- MARTINI Force Field
- Computational Biophysics
- Membrane Biophysics
- Scientific Data Analysis
- Quantitative Analysis of Simulation Trajectories
- Scientific Visualization

---

## Future Work

Potential improvements include:

- Longer simulations to allow clearer lipid phase separation
- Time-resolved radial distribution function analysis
- Automated identification of liquid-ordered membrane regions
- Visualization coloured by lipid species instead of bead type
- Comparison across different membrane compositions

---

## Repository Structure

```text
## Repository Structure

```text
.
├── PIP2/                             # Main simulation system
│   ├── frame/                        # Membrane snapshots during simulation
│   │   ├── frame1.gro
│   │   ├── frame2.gro
│   │   ├── frame100.gro
│   │   └── final.gro
│   │
│   ├── trajectory/                   # Simulation trajectory files
│   ├── PIP2.gro                      # Initial membrane structure
│   ├── PIP2.top                      # System topology
│   ├── PIP2_WO.gro                   # Membrane without PIP₂
│   ├── PIP2_WO.top
│   ├── martini_v2.2.itp              # MARTINI force field
│   ├── martini_v2.0_*.itp            # Lipid topology files
│   ├── minimize.tpr                  # Energy minimization input
│   ├── minimized_PIP2.gro            # Minimized membrane
│   ├── npt.mdp                       # NPT equilibration parameters
│   └── msd_*.xvg                     # Mean squared displacement results
│
├── PIP2_2ns/                         # 2 ns equilibration outputs
│   ├── PIP2_100.xtc                  # Simulation trajectory
│   ├── PIP2_100.trr                  # Full precision trajectory
│   ├── run.tpr                       # Simulation input
│   ├── index.ndx                     # Atom index groups
│   ├── frame*.gro                    # Representative membrane snapshots
│   ├── final.gro                     # Final equilibrated structure
│   ├── rdf_*.xvg                     # Radial distribution functions
│   └── msd_*.xvg                     # Mean squared displacement analysis
│
├── PIP2_WO/                          # Scripts for simulations without PIP₂
│   └── PIP2_WO.sh
│
├── insane scripts/                   # Membrane construction utilities
│   ├── create_membrane.sh
│   ├── martinize.py
│   └── clean_include_topology.py
│
├── [IS315]_Final_Project.ipynb       # Analysis notebook including figures 
├── membrane.gro                      # Initial membrane structure
├── insane_script.sh                  # Membrane generation script
├── LICENSE
└── README.md
```

---

## References

This project follows the method provided by: https://doi.org/10.1021/acs.jpcb.9b11095 
