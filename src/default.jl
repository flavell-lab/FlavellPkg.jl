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
    Pkg.add("PyCall")
    ENV["PYTHON"] = ""
    Pkg.build("PyCall")
    Pkg.add("PyPlot")
    Pkg.build("PyPlot")
    Pkg.add("IJulia")
end
