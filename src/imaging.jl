import Pkg

function install_imaging(install_dev_branch=false)
    pkg_list = []
    # add private pkg
    for pkg = ["SegmentationStats", "GPUFilter", "MHDIO", "FFTRegGPU", "ImageDataIO", "WormCurveFinder", "Clustering", "UNet2D",
        "WormFeatureDetector", "SegmentationTools", "ND2Process", "SLURMManager",
        "RegistrationGraph", "ExtractRegisteredData", "CaAnalysis", "SegmentationStats", "BehaviorDataNIR"]

        if install_dev_branch
            try
                pkg_ = Pkg.PackageSpec(name=pkg,
                    url="git@github.com:flavell-lab/$(pkg).jl.git", rev="develop")
                Pkg.add(pkg_)
            catch # develop does not exist
                push!(pkg_list, Pkg.PackageSpec(name=pkg,
                    url="git@github.com:flavell-lab/$(pkg).jl.git"))
            end
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
end
