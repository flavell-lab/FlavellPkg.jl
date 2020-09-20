import Pkg

function install_imaging()
    pkg_list=  []
    
    for pkg = ["MHDIO", "ImageDataIO", "WormCurveFinder",
        "WormFeatureDetector", "SegmentationTools", "CaAnalysis", "ND2Process"]
        push!(pkg_list, Pkg.PackageSpec(url="git@github.com:flavell-lab/$(pkg).jl.git"))
    end
        
    # adding
    for pkg = pkg_list
        Pkg.add(pkg)
    end
    # precompiling
    for pkg = pkg_list
        eval(:(using $(Symbol(pkg))))
    end
end
