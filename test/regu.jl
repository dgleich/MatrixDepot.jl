n = rand(1:10)

r = matrixdepot("deriv2", n, false)
rf32 = matrixdepot("deriv2", Float32, n, false)

@test_approx_eq r.A*r.x  r.b
@test issym(r.A)


r = matrixdepot("shaw", 2*n, false)

@test issym(r.A)

rf32 = matrixdepot("shaw", Float32, 2*n, false)

r = matrixdepot("wing", n, false)

@test r.A == matrixdepot("wing", n, 1/3, 2/3, false).A

r = matrixdepot("foxgood", n, false)
rf32 = matrixdepot("foxgood", Float32, n, false)

r = matrixdepot("heat", 2*n)
rf32 = matrixdepot("heat", Float32, 2*n)

r = matrixdepot("baart", 2*n)
rf32 = matrixdepot("baart", Float32, 2*n)

n = rand(1:5)
r = matrixdepot("phillips", 4*n)
rf32 = matrixdepot("phillips", Float32, 4*n)
