# 🌡️ Heat Transfer — Thermal Conductivity of Metals vs. Nonmetals

> **Rutgers University – School of Engineering**  
> *Anna Kalogridis | Irina Grigoryeva | Ken Ang | Nilkanth Patel | Gabriel Mustafa*

---

## 📌 Overview

This lab investigated how material type affects **heat conduction** through stacked 1" cubes subjected to a common hotplate source. FLIR thermal camera images were processed in MATLAB to extract temperature gradient profiles and calculate experimental heat flux (Q) and thermal resistance (R) for metal and nonmetal material stacks.

**Hypothesis:** Materials with higher atomic density and metallic bonding will exhibit the lowest thermal resistance.

---

## 🧱 Materials Tested

| Category | Materials |
|---|---|
| **Metals** | Copper (401 W/m·K), Aluminum (237), Brass (109), Steel (15.1) |
| **Nonmetals** | Acrylic (0.19 W/m·K), PVC (0.19), Nylon (0.25), Pinewood (0.12) |

Each trial stacked **3 cubes** (L = 0.0254 m per cube) in different arrangements, for a total of **3 metal trials** and **3 nonmetal trials**.

---

## 📊 Results

### Figure 1 — Thermal Gradient: Metal Trials
![Metal Trials](assets/metal_trials.png)

*Temperature profile (°C) across cube height for three metal stack arrangements. Steep gradients near the hotplate indicate high heat flux through conductive metals.*

---

### Figure 2 — Thermal Gradient: Nonmetal Trials
![Nonmetal Trials](assets/nonmetal_trials.png)

*Temperature profile for three nonmetal stack arrangements. Smoother, more uniform curves reflect the insulating behavior and higher thermal resistance of nonmetals.*

---

### Figure 3 — Metals vs. Nonmetals (Averaged)
![Metals vs Nonmetals](assets/metals_vs_nonmetals.png)

*Averaged thermal gradient across all trials. Nonmetals showed a steeper overall rise at higher cube heights, consistent with greater heat accumulation due to poor conductivity.*

---

## 🔢 Key Calculations

**Thermal Resistance** `R = L / (k · A)` where A = L²

| Stack | R (K/W) |
|---|---|
| Metal Trial 1 (Brass + Steel + Copper) | 0.0263 |
| Metal Trial 2 (Brass + Aluminum + Copper) | 0.0117 |
| Nonmetal Trial 1 (Acrylic + Pine + PVC) | 17.77 |

> Nonmetal stacks showed **~3 orders of magnitude** higher resistance than metal stacks, confirming the hypothesis.

---

## 🛠️ Methodology

```
Step 1 → Capture FLIR thermal images of each stacked cube trial
Step 2 → Import images into MATLAB, convert RGB → Grayscale
Step 3 → Compute row-wise pixel intensity means as temperature proxies
Step 4 → Scale pixel values to FLIR-reported T_min / T_max (°C)
Step 5 → Calculate R per material and Q_exp vs Q_est per stack
Step 6 → Compute percent error between experimental and estimated Q
```

---

## 🧰 Tools & Tech

![MATLAB](https://img.shields.io/badge/Code-MATLAB-orange?style=flat-square)
![FLIR](https://img.shields.io/badge/Sensor-FLIR%20Thermal%20Camera-red?style=flat-square)
![Rutgers](https://img.shields.io/badge/Institution-Rutgers%20SOE-CC0000?style=flat-square)

---

## 📁 Repository Structure

```
├── assets/                   # Thermal gradient plots (Figures 1–3)
├── data/                     # Raw FLIR thermal images (.png)
├── HeatTransfer_Code.m       # Full MATLAB analysis script
└── README.md
```

> 💡 **Note:** Place FLIR images in `/data/` and rename to match filenames in the `.m` script (`metals1.1.png`, etc.) before running.

---

*Conducted under controlled lab conditions. All thermal data sourced from FLIR One Pro imagery. 🔥*
