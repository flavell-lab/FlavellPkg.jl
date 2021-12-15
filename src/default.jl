import Pkg

function install_default()
    pkg_list = []

    # add registered pkg
    for pkg = ["CUDA", "IJulia", "HDF5", "NaNMath", "LsqFit", "Optim", "Interpolations",
         "Distributions", "DataStructures", "BenchmarkTools", "ProgressMeter",
         "Images", "Clustering", "MultivariateStats"]
        push!(pkg_list, pkg)
    end

    # adding
    for pkg = pkg_list
        Pkg.add(pkg)
    end

    # add private pkg
    for pkg = ["FlavellBase"]
        push!(pkg_list, Pkg.PackageSpec(name=pkg,
            url="git@github.com:flavell-lab/$(pkg).jl.git"))
    end

    # adding
    for pkg = pkg_list
      Pkg.add(pkg)
    end
end
