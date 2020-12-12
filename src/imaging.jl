import Pkg

function install_imaging()
    pkg_list=  []
    # add private pkg
    for pkg = ["MHDIO", "ImageDataIO", "WormCurveFinder", "Clustering",
        "WormFeatureDetector", "SegmentationTools", "CaAnalysis",
        "ND2Process", "SLURMManager", "RegistrationGraph", "ExtractRegisteredData"]
        push!(pkg_list, Pkg.PackageSpec(name=pkg,
            url="git@github.com:flavell-lab/$(pkg).jl.git"))
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
end
