import Pkg

function install_default()
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

    # setting to use julia python distribution (instead of any existing system one)
    ENV["PYTHON"] = ""
    Pkg.add("PyCall")
    Pkg.build("PyCall")
    using PyCall

    Pkg.add("PyPlot")
    ENV["PYTHON"] = ""
    Pkg.build("PyPlot")
    using PyPlot
    using IJulia
end
