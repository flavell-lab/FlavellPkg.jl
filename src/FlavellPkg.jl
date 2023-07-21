module FlavellPkg

include("util.jl")
include("py.jl")
include("default.jl")
include("ANTSUN.jl")
include("behavior.jl")
include("CePNEM.jl")

export install_py,
    install_default,
    install_ANTSUN,
    install_behavior,
    install_CePNEM

end # module
