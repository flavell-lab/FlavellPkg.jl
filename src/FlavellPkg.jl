module FlavellPkg

include("py.jl")
include("default.jl")
include("imaging.jl")
include("behavior.jl")

export install_py,
    install_default,
    install_imaging,
    install_behavior

end # module
