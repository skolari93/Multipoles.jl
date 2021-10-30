using Plots
using CoordinateTransformations

include("sphericalHarmonics.jl")

plotlyjs()

l = 100
ϕ = collect(range(0, 2 * π, length=l))
θ = collect(range(0, π, length=l))

n = 2
m  = 0

sphVal = transpose(sphevaluate.(θ, ϕ', n, m))

x = abs.(sphVal) .* (cos.(ϕ) * sin.(θ)')
y = abs.(sphVal) .* (sin.(ϕ) * sin.(θ)')
z = abs.(sphVal) .*  (ones(l) * cos.(θ)')

function Ycart(n::Int, m::Int, x, y, z) 
    v = SphericalFromCartesian()([x, y, z])
    return sphevaluate.(v.θ, v.ϕ, n, m)
end

surface(x,y,z,
    title="n=$(n), m=$(m)",
    fill_z=sphVal,
    framestyle=:none,
    axis=nothing
)

