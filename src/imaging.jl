import Pkg

function install_imaging()
    pkg_list = []
    # add private pkg
    for pkg = ["GPUFilter", "MHDIO", "FFTRegGPU", "ImageDataIO", "WormCurveFinder", "Clustering",
        "WormFeatureDetector", "SegmentationTools", "ND2Process", "SLURMManager",
        "RegistrationGraph", "ExtractRegisteredData", "CaAnalysis", "BehaviorDataNIR"]
        push!(pkg_list, Pkg.PackageSpec(name=pkg,
            url="git@github.com:flavell-lab/$(pkg).jl.git"))
    end

    for pkg = ["Statistics", "StatsBase", "DelimitedFiles", "Cairo", "Interact", "WebIO",
        "Plots", "Dates", "JLD2", "TotalVariation"]
       push!(pkg_list, pkg)
   end

    # adding
    for pkg = pkg_list
        Pkg.add(pkg)
    end
end
