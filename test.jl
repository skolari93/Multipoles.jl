using Plots
using CoordinateTransformations
include("sphericalHarmonics.jl")

plotlyjs()

ϕ = collect(range(0, 2 * π, length=100))
θ = collect(range(0, π, length=100))

n = 100

x = cos.(θ) * sin.(ϕ)';
y = sin.(θ) * sin.(ϕ)';
z = ones(n) * cos.(ϕ)';
function Ycart(n::Int, m::Int, x, y, z) 
    v = SphericalFromCartesian()([x, y, z])
    return Y(n, m, v.θ, v.ϕ)
end
Yval = Ycart.(0, 0, x, y, z)

surface(x,y,z, 
    fill_z=Yval,
    framestyle=:none,
    axis=nothing
)

