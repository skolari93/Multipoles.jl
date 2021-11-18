using Plots, FastTransforms, Colors
plotlyjs()

n = 3
m  = 2

l = 1000
ϕ = collect(range(0, 2 * π, length=l))
θ = collect(range(0, π, length=l))

sphVal = transpose(sphevaluate.(θ, ϕ', n, m)) #  should be complex??
#=
function h1(r)
    end

function S(n::INt, m::Int, k, r, θ, ϕ)
    return h1(k * r) * sphevaluate(θ, ϕ, n, m)
end

function M(n1::Int, n2::Int, n3::Int)
    l = n1 + n2 + n3
    
end
=#

x = abs.(sphVal) .* (cos.(ϕ) * sin.(θ)')
y = abs.(sphVal) .* (sin.(ϕ) * sin.(θ)')
z = abs.(sphVal) .*  (ones(l) * cos.(θ)')

p=surface(x,y,z,
    title="n=$(n), m=$(m)",
    fill_z=sphVal,
    framestyle=:none,
    axis=nothing,
    fill=cgrad([colorant"rgb(240,274,4)", 
    colorant"rgb(0,73,255)"])
)
#savefig(p,"file.svg")
#rgb(251,73,38)
#=
heatmap(sphVal, 
    fill=cgrad([colorant"rgb(240,274,4)", 
    colorant"rgb(0,73,255)"]), 
    border=:none, 
    legend = :none,
    axis=nothing)
=#