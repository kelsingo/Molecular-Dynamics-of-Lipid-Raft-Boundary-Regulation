# Molecular Simulations of Lipid Microdomains for the Structural Preference of PIP2 Lipid

## Overview

This project investigates the localization of **phosphatidylinositol 4,5-bisphosphate (PIP₂)** within raft-forming lipid membranes using **coarse-grained molecular dynamics (CG-MD)** simulations performed in **GROMACS** with the **MARTINI force field**.

Lipid rafts are cholesterol- and saturated lipid-rich membrane microdomains that regulate numerous cellular processes, including signal transduction, membrane trafficking, and protein organization. Despite the biological importance of PIP₂, its localization within these membrane domains remains an active area of research.

Using a simplified asymmetric lipid bilayer model, this project analyzes interactions between PIP₂ and surrounding membrane lipids through quantitative molecular dynamics analyses, including **Potential Energy (PE)**, **Radial Distribution Functions (RDF)**, and **Mean Squared Displacement (MSD)**.

> **Course Project:** Introduction to Molecular Simulations

---

## Biological Motivation

Cell membranes are heterogeneous structures composed of saturated lipids, unsaturated lipids, and cholesterol. These lipids laterally organize into two major membrane environments:

- **Liquid-ordered (Lo) domains (lipid rafts):** enriched in saturated phospholipids (DPPC) and cholesterol
- **Liquid-disordered (Ld) domains:** enriched in unsaturated phospholipids (DIPC)

PIP₂ is an essential signalling lipid involved in:

- Cell signalling
- Protein recruitment
- Actin cytoskeleton regulation
- Membrane dynamics

Because lipid rafts are only **2–20 nm** in size, direct experimental observation is challenging. Coarse-grained molecular dynamics enables efficient simulation of membrane organization while preserving essential biophysical properties.

---

## Project Objectives

- Construct an asymmetric raft-forming lipid bilayer containing PIP₂
- Simulate membrane equilibration using coarse-grained molecular dynamics
- Characterize membrane stability during equilibration
- Quantify interactions between PIP₂ and surrounding lipid species
- Investigate whether PIP₂ preferentially associates with raft-like membrane environments

---

## Membrane Composition

### Outer Leaflet

| Lipid | Count |
|-------|------:|
| DIPC | 78 |
| DPPC | 90 |
| CHOL | 56 |

### Inner Leaflet

| Lipid | Count |
|-------|------:|
| DIPC | 73 |
| DPPC | 84 |
| CHOL | 56 |
| PIP₂ | 11 |

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
| Software | GROMACS |
| Force Field | MARTINI Coarse-Grained |
| Ensemble | NPT |
| Temperature | 295 K |
| Time Step | 0.02 ps |
| Simulation Length | 10 ns |

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
.
├── mdp/                # GROMACS simulation parameter files
├── topology/           # Membrane topology files
├── analysis/           # Analysis scripts
├── figures/            # Generated figures
├── results/            # Simulation outputs
└── README.md
```

---

## References

This project was developed based on published studies investigating lipid raft formation and PIP₂ localization using coarse-grained molecular dynamics simulations. A complete reference list is available in the accompanying project report.
