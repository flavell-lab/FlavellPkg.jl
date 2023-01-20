function install_imaging(install_dev_branch=false)
    pkg_list = Pkg.Types.PackageSpec[]

    for pkg = ["ColorVectorSpace", "MultipleTesting", "Gen", "UMAP", "ImageShow", "ImageCore", "Combinatorics",
            "HypothesisTests", "SpecialFunctions", "FileIO", "StatsPlots", "GLM", "DataFrames", "LinearAlgebra"]
        push!(pkg_list, Pkg.PackageSpec(name=pkg))
    end

    # add private pkg
    for pkg = ["FlavellConstants","ANTSUNData","NeuroPALData","AnalysisBase","EncoderModel","EncoderModelGen","CePNEMAnalysis"]

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
