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
### Default
Command: `install_default()`  
List: `PyCall`, `PyPlot`, `IJulia`, `HDF5`, `NaNMath`, `LsqFit`, `Optim`, `Interpolations`, `Distributions`, `DataStructures`, `BenchmarkTools`, `ProgressMeter`, `Images`, `Clustering`, `MultivariateStats`

### Behavior packages
Command: `install_behavior()`  
List: `BehaviorData`, `BehaviorPlot`

### Imaging packages
Command: `install_imaging()`  
List: `FlavellBase`, `MHDIO`, `ImageDataIO`, `WormCurveFinder`, `WormFeatureDetector`, `SegmentationTools`, `CaAnalysis`
