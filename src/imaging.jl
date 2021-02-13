import Pkg

function install_imaging()
    pkg_list = []
    # add private pkg
    for pkg = ["GPUFilter", "MHDIO", "FFTRegGPU", "ImageDataIO", "WormCurveFinder", "Clustering",
        "WormFeatureDetector", "SegmentationTools", "ND2Process", "SLURMManager",
        "RegistrationGraph", "ExtractRegisteredData", "CaAnalysis"]
        push!(pkg_list, Pkg.PackageSpec(name=pkg,
            url="git@github.com:flavell-lab/$(pkg).jl.git"))
    end

    for pkg = ["Statistics", "StatsBase", "DelimitedFiles", "Cairo", "Interact", "WebIO",
        "Plots", "Dates", "JLD2"]
       push!(pkg_list, pkg)
   end

    # adding
    for pkg = pkg_list
        Pkg.add(pkg)
    end
    # precompiling
    for pkg = pkg_list
        pkg_name = isa(pkg, Pkg.Types.PackageSpec) ? pkg.name : pkg
        eval(:(using $(Symbol(pkg_name))))
    end
    using WebIO
    # install WebIO Jupyter Lab extension
    WebIO.install_jupyter_labextension()
    WebIO.install_jupyter_nbextension()
end
