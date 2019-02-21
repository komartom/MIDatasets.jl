using Test, MIDatasets

@test length(midatasets()) == 29

X, y = midataset("Musk1")
@test length(X) == length(y)

X, y, f = midataset("Musk1", folds=true)
@test length(f) == 5
@test length(f[1]) == 10
@test length(f[1][1]) == length(X) 

@test_broken midataset("non-existing-dataset")
