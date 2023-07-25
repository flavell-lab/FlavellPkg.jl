import Pkg
function install_default()
    pkg_list = Pkg.Types.PackageSpec[]

    # add registered pkg
    for pkg = ["CUDA", "IJulia", "HDF5", "NaNMath", "LsqFit", "Optim", "Interpolations",
         "Distributions", "DataStructures", "BenchmarkTools", "ProgressMeter",
         "Images", "Clustering", "MultivariateStats", "StatsBase.jl"]
        push!(pkg_list, Pkg.PackageSpec(name=pkg))
    end

    # add private pkg
    for pkg = ["FlavellBase"]
        push!(pkg_list, Pkg.PackageSpec(name=pkg,
            url="git@github.com:flavell-lab/$(pkg).jl.git"))
    end

    # adding
    for pkg = pkg_list
      Pkg.add(pkg_list)
    end
end
