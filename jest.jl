using Plots; plotlyjs()  # or: pyplot()
n = 300
θ = LinRange(0, π, n)
ϕ = LinRange(0, 2π, n)
xx = @. sin(θ) * cos(ϕ')
yy = @. sin(θ) * sin(ϕ')
zz = @. cos(θ) * ones(n)'
surface(xx, yy, zz, fill_z=5 * sin.(10xx .* yy), size=(600, 600))