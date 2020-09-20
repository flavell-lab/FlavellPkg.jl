import Pkg

function install_default(use_julia_conda=true)
    # pycall, pyplot
    install_py(use_julia_conda)

    pkg_list = []

    # add private pkg
    for pkg = ["FlavellBase"]
        push!(pkg_list, Pkg.PackageSpec(name=pkg,
            url="git@github.com:flavell-lab/$(pkg).jl.git"))
    end

    # add registered pkg
    for pkg = ["IJulia", "HDF5", "NaNMath", "LsqFit", "Optim", "Interpolations",
         "Distributions", "DataStructures", "BenchmarkTools", "ProgressMeter",
         "Images", "Clustering", "MultivariateStats"]
        push!(pkg_list, pkg)
    end

    # adding
    for pkg = pkg_list
      Pkg.add(pkg)
    end
    # precompiling
    for pkg = pkg_list
        pkg_name = isa(pkg, Pkg.Types.PackageSpec) ? pkg.name : pkg
        eval(:(using $(Symbol(pkg))))
    end
end
