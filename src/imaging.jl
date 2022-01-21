import Pkg

function install_imaging(install_dev_branch=false)
    pkg_list = []

    for pkg = ["Statistics", "StatsBase", "DelimitedFiles", "Cairo", "Interact", "WebIO",
        "Plots", "Dates", "JLD2", "VideoIO", "FFTW", "GLMNet", "Suppressor",
        "Revise", "InformationMeasures", "LsqFit"]
       push!(pkg_list, pkg)
    end

    for pkg = pkg_list
        Pkg.add(pkg)
    end

    # add private pkg
    for pkg = ["TotalVariation", "SegmentationStats", "GPUFilter", "MHDIO", "NRRDIO", "FFTRegGPU", "ImageDataIO", "WormCurveFinder", "Clustering", "UNet2D",
        "WormFeatureDetector", "SegmentationTools", "ND2Process", "SLURMManager",
        "RegistrationGraph", "ExtractRegisteredData", "CaAnalysis", "BehaviorDataNIR"]

        if install_dev_branch
            try
                pkg_ = Pkg.PackageSpec(name=pkg,
                    url="git@github.com:flavell-lab/$(pkg).jl.git", rev="develop")
                Pkg.add(pkg_)
            catch # develop does not exist
                @warn("Develop branch of $(pkg) not found.")
                pkg_ = Pkg.PackageSpec(name=pkg,
                    url="git@github.com:flavell-lab/$(pkg).jl.git")
                Pkg.add(pkg_)
            end
        else
            pkg_ = Pkg.PackageSpec(name=pkg,
                url="git@github.com:flavell-lab/$(pkg).jl.git")
            Pkg.add(pkg_)
        end
    end
end
