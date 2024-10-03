cd(@__DIR__)

using JLD2
using CodecZlib

include("src/modelA.jl")

function main()
    @init_state

    for idx in 1:2500
        thermalize(ϕ, m², L^2)
        save_state("/home/jkott/perm/modelA/snapshots/snapshot_L_$(L)_seed_$(seed)_id_$(idx).jld2", ϕ, m²)
        @show idx
    end
end

main()
