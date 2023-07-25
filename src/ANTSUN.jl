function install_ANTSUN(install_dev_branch=false)
    pkg_list = Pkg.Types.PackageSpec[]

    for pkg = ["DelimitedFiles", "Cairo", "Interact", "WebIO",
        "Plots", "JLD2", "VideoIO", "FFTW", "GLMNet", "InformationMeasures", "LsqFit",
        "Rotations", "CoordinateTransformations", "ImageTransformations", "H5Zblosc"]
        push!(pkg_list, Pkg.PackageSpec(name=pkg))
    end

    # add private pkg
    for pkg = ["MHDIO","TotalVariation", "SegmentationStats", "GPUFilter", "NRRDIO", "FFTRegGPU", "ImageDataIO", "WormCurveFinder", "Clustering", "UNet2D",
        "WormFeatureDetector", "SegmentationTools", "ND2Process", "SLURMManager", "FlavellConstants",
        "RegistrationGraph", "ExtractRegisteredData", "CaAnalysis", "BehaviorDataNIR", "ANTSUNData", "ANTSUNDataJLD2"]

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
