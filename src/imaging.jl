function install_imaging(install_dev_branch=false)
    pkg_list = Pkg.Types.PackageSpec[]

    for pkg = ["Statistics", "StatsBase", "DelimitedFiles", "Cairo", "Interact", "WebIO",
        "Plots", "Dates", "JLD2", "VideoIO", "FFTW", "GLMNet", "Suppressor",
        "Revise", "InformationMeasures", "LsqFit"]
        push!(pkg_list, Pkg.PackageSpec(name=pkg))
    end

    # add private pkg
    for pkg = ["MHDIO","TotalVariation", "SegmentationStats", "GPUFilter", "NRRDIO", "FFTRegGPU", "ImageDataIO", "WormCurveFinder", "Clustering", "UNet2D",
        "WormFeatureDetector", "SegmentationTools", "ND2Process", "SLURMManager",
        "RegistrationGraph", "ExtractRegisteredData", "CaAnalysis", "BehaviorDataNIR"]

        remote_url = "git@github.com:flavell-lab/$(pkg).jl.git"
        if install_dev_branch && check_develop(remote_url)
            pkg_ = Pkg.PackageSpec(name=pkg, url="git@github.com:flavell-lab/$(pkg).jl.git", rev="develop")
            push!(pkg_list, pkg_)
        else
            pkg_ = Pkg.PackageSpec(name=pkg, url="git@github.com:flavell-lab/$(pkg).jl.git")
            push!(pkg_list, pkg_)
        end
    end

    Pkg.add(pkg_list)
end
