module FlavellPkg

include("default.jl")
include("imaging.jl")
include("behavior.jl")

export install_default,
    install_imaging,
    install_behavior

end # module
