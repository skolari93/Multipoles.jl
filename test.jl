using Plots
using FastTransforms

include("sphericalHarmonics.jl")

plotlyjs()

l = 100
ϕ = collect(range(0, 2 * π, length=l))
θ = collect(range(0, π, length=l))

n = 3
m  = 2

Yvalues = transpose(sphevaluate.(θ, ϕ', n, m))

x = abs.(Yvalues) .* (cos.(ϕ) * sin.(θ)')
y = abs.(Yvalues) .* (sin.(ϕ) * sin.(θ)')
z = abs.(Yvalues) .*  (ones(l) * cos.(θ)')

surface(x,y,z,
    title="n=$(n), m=$(m)",
    fill_z=Yval,
    framestyle=:none,
    axis=nothing
)

