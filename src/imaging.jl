import Pkg

function install_imaging(install_dev_branch=false)
    pkg_list = []
    # add private pkg
    for pkg = ["GPUFilter", "MHDIO", "FFTRegGPU", "ImageDataIO", "WormCurveFinder", "Clustering",
        "WormFeatureDetector", "SegmentationTools", "ND2Process", "SLURMManager",
        "RegistrationGraph", "ExtractRegisteredData", "CaAnalysis", "SegmentationStats", "UNet2D", "BehaviorDataNIR"]

        if install_dev_branch
            push!(pkg_list, Pkg.PackageSpec(name=pkg,
                url="git@github.com:flavell-lab/$(pkg).jl.git", rev="develop"))
        else
            push!(pkg_list, Pkg.PackageSpec(name=pkg,
                url="git@github.com:flavell-lab/$(pkg).jl.git"))
        end
    end

    for pkg = ["Statistics", "StatsBase", "DelimitedFiles", "Cairo", "Interact", "WebIO",
        "Plots", "Dates", "JLD2", "TotalVariation", "VideoIO", "FFTW", "GLMNet", "Suppressor",
        "Revise", "InformationMeasures", "LsqFit"]
       push!(pkg_list, pkg)
    end

    # adding
    for pkg = pkg_list
        Pkg.add(pkg)
    end
    println("Please install the torch and unet2d Python packages in Julia's python environment.")
end
