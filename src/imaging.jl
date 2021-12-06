import Pkg

function install_imaging(install_dev_branch=false)
    pkg_list = []

    for pkg = ["Statistics", "StatsBase", "DelimitedFiles", "Cairo", "Interact", "WebIO",
        "Plots", "Dates", "JLD2", "TotalVariation", "VideoIO", "FFTW", "GLMNet", "Suppressor",
        "Revise", "InformationMeasures", "LsqFit"]
       push!(pkg_list, pkg)
    end

    for pkg = pkg_list
        Pkg.add(pkg)
    end

    pkg_list = []

    # add private pkg
    for pkg = ["SegmentationStats", "GPUFilter", "MHDIO", "FFTRegGPU", "ImageDataIO", "WormCurveFinder", "Clustering", "UNet2D",
        "WormFeatureDetector", "SegmentationTools", "ND2Process", "SLURMManager",
        "RegistrationGraph", "ExtractRegisteredData", "CaAnalysis", "BehaviorDataNIR"]

        if install_dev_branch
            try
                push!(pkg_list, Pkg.PackageSpec(name=pkg,
                    url="git@github.com:flavell-lab/$(pkg).jl.git", rev="develop"))
            catch # develop does not exist
                @warn("Develop branch of $(pkg) not found.")
                push!(pkg_list, Pkg.PackageSpec(name=pkg,
                    url="git@github.com:flavell-lab/$(pkg).jl.git"))
            end
        else
            push!(pkg_list, Pkg.PackageSpec(name=pkg,
                url="git@github.com:flavell-lab/$(pkg).jl.git"))
        end
    end

    # adding
    for pkg = pkg_list
        Pkg.add(pkg)
    end
end
