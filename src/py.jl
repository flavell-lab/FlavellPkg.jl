function install_py(use_julia_conda=true)
    # pycall
    Pkg.add("PyCall")
    # setting to use julia python distribution (instead of any existing system one)
    if use_julia_conda
        ENV["PYTHON"] = ""
    end
    Pkg.build("PyCall")
    
    # pyplot
    Pkg.add("PyPlot")
    Pkg.build("PyPlot")
    
    using PyCall
    using PyPlot
end
