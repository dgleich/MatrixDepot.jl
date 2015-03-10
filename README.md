
# ![logo](doc/logo2.png) Matrix Depot 

[![Build Status](https://travis-ci.org/weijianzhang/MatrixDepot.jl.svg?branch=master)](https://travis-ci.org/weijianzhang/MatrixDepot.jl)
| Julia 0.3 [![MatrixDepot](http://pkg.julialang.org/badges/MatrixDepot_release.svg)](http://pkg.julialang.org/?pkg=MatrixDepot&ver=release)
| Julia 0.4 [![MatrixDepot](http://pkg.julialang.org/badges/MatrixDepot_nightly.svg)](http://pkg.julialang.org/?pkg=MatrixDepot&ver=nightly)

An Extensible test matrix collection for Julia.

* [Documentation](http://matrixdepotjl.readthedocs.org/en/latest/)

* [Examples](http://nbviewer.ipython.org/github/weijianzhang/MatrixDepot.jl/blob/master/doc/juliadoc.ipynb)

* [Release Notes](https://github.com/weijianzhang/MatrixDepot.jl/blob/master/NEWS.md)

## Install

To install the release version, type

```julia
julia> Pkg.add("MatrixDepot")
```

## Basic Usage

To see all the matrices in the collection, type

```julia
julia> matrixdepot()
```

We can generate a Hilbert matrix of size 4 by typing

```julia
julia> matrixdepot("hilb", 4)
4x4 Array{Float64,2}:
 1.0       0.5       0.333333  0.25    
 0.5       0.333333  0.25      0.2     
 0.333333  0.25      0.2       0.166667
 0.25      0.2       0.166667  0.142857
```

We can type the matrix name to see the paramter options and matrix
properties.

```julia
julia> matrixdepot("hilb")
Hilbert matrix: 
                  
Input options: 
                  
(type), dim: the dimension of the matrix
                  
(type), row_dim, col_dim: the row and column dimension 
                  
['inverse', 'ill-cond', 'symmetric', 'pos-def']
```

We can aslo specify the data type

```julia
julia> matrixdepot("hilb", Float16, 5, 3)
5x3 Array{Float16,2}:
 1.0      0.5      0.33325
 0.5      0.33325  0.25   
 0.33325  0.25     0.19995
 0.25     0.19995  0.16663
 0.19995  0.16663  0.14282
```

By typing a matrix name, we can see what properties that matrix have.
Conversely, if we type a property (or properties), we can see all the 
matrices (in the collection) having that property (or properties).

```julia
julia> matrixdepot("symmetric")
12-element Array{ASCIIString,1}:
 "hilb"    
 "cauchy"  
 "circul"  
 "dingdong"
 "invhilb" 
 "moler"   
 "pascal"  
 "pei"     
 "clement" 
 "fiedler" 
 "minij"   
 "tridiag" 
```

## Interface to the UF Sparse Matrix Collection and NIST Matrix Market

Use ``MatrixDepot.get(NAME)``, where ``NAME`` is ``collection
name + '/' + matrix name``, to download a test matrix from the University of
Florida Sparse Matrix Collection:
http://www.cise.ufl.edu/research/sparse/matrices/list_by_id.html.  For
example:

```julia
julia> MatrixDepot.get("HB/illc1850")
```
When download is complete, we can generate it using

```julia
julia> matrixdepot("illc1850", :r)
```
and check matrix information using

```julia
julia> matrixdepot("illc1850")
Dict{ASCIIString,Any} with 10 entries:
  "name"   => "HB/illc1850"
  "A"      => …
  "author" => "M. Saunders"
  "kind"   => "least squares problem"
  "Zeros"  => …
  "b"      => [64.06762598…
  "title"  => "UNSYMMETRIC LEAST-SQUARES PROBLEM.                  SAUNDERS 1979."
  "id"     => 170.0
  "date"   => "1979"
  "ed"     => "I. Duff, R. Grimes, J. Lewis"
```

Use ``MatrixDepot.get(NAME, collection = :MM)``, where ``NAME`` is
``collection name + '/' + set name + '/' + matrix name`` to download
a test matrix from NIST Matrix Market: http://math.nist.gov/MatrixMarket/.
For example,

```julia
MatrixDepot.get("Harwell-Boeing/lanpro/nos5", collection = :MM)
```

See documentation for more details.

## References

- Nicholas J. Higham,
  "Algorithm 694, A Collection of Test Matrices in MATLAB",
  *ACM Trans. Math. Software*,
  vol. 17. (1991), pp 289-305
  [[pdf]](http://www.maths.manchester.ac.uk/~higham/narep/narep172.pdf)
  [[doi]](https://dx.doi.org/10.1145/114697.116805)

- T.A. Davis and Y. Hu,
  "The University of Florida Sparse Matrix Collection",
  *ACM Transaction on Mathematical Software*,
  vol. 38, Issue 1, (2011), pp 1:1-1:25
  [[pdf]](http://www.cise.ufl.edu/research/sparse/techreports/matrices.pdf)
