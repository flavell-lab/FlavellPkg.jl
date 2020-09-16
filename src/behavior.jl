import Pkg

function install_behavior()
    pkg_list = ["BehaviorData", "BehaviorPlot"]
    # adding
    for pkg = pkg_list
        Pkg.add(Pkg.PackageSpec(url="git@github.com:flavell-lab/$(pkg).jl.git"))
    end

    # precompiling
    for pkg = pkg_list
        eval(:(using $(Symbol(pkg))))
    end
end
