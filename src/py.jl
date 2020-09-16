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
    
    # precompile
    pkg_list = ["PyCall", "PyPlot"]
    for pkg = pkg_list
        eval(:(using $(Symbol(pkg))))
    end
end
