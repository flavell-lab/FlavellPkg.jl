# FlavellPkg.jl
## Instructions
1. Add this package in Julia  
```julia
] add git@github.com:flavell-lab/FlavellPkg.jl.git
```
2. Run an install function  
```julia
using FlavellPkg
install_default()
```
Ignore the warning message `Package FlavellPkg does not have ... in its dependencies`  

## Available install scripts
Each install script installs many packages from the official Julia repositories, plus the Flavell Lab packages listed below.
### Default
Command: `install_default()`  
List: `FlavellBase`

### Behavior packages
Command: `install_behavior()`  
List: `BehaviorData`, `BehaviorPlot`

### ANTSUN packages
Command: `install_ANTSUN()`  
List: `MHDIO`, `TotalVariation`, `SegmentationStats`, `GPUFilter`, `NRRDIO`, `FFTRegGPU`, `ImageDataIO`, `WormCurveFinder`, `Clustering`, `UNet2D`, `WormFeatureDetector`, `SegmentationTools`, `ND2Process`, `SLURMManager`, `RegistrationGraph`, `CaAnalysis`, `ExtractRegisteredData`, `BehaviorDataNIR`, `FlavellConstants`, `ANTSUNData`, `ANTSUNDataJLD2`

### CePNEM packages
Command: `install_CePNEM()`  
List: `TotalVariation`, `FlavellConstants`, `ANTSUNData`, `NeuroPALData`, `AnalysisBase`, `EncoderModel`, `CePNEM`, `CePNEMAnalysis`, `HierarchicalPosteriorModel`, `ConnectomePlot`
