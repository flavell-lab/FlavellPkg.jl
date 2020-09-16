import Pkg

function install_default(use_julia_conda=true)
    # pycall, pyplot
    install_py(use_julia_conda)
    
    pkg_list = ["IJulia", "HDF5", "NaNMath", "LsqFit", "Optim", "Interpolations", "Distributions",
    "DataStructures", "BenchmarkTools", "ProgressMeter", "Images", "Clustering", "MultivariateStats"]

    # adding
    for pkg = pkg_list
      Pkg.add(pkg)
    end
    # precompiling
    for pkg = pkg_list
      eval(:(using $(Symbol(pkg))))
    end
end
