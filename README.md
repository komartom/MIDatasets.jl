# Multiple Instance Datasets (MIDatasets.jl)

Musk1, Musk2, Fox, Tiger, Elephant,...

Datasets are taken from <http://www.miproblems.org/datasets/>

The structure of a dataset: Array{Array{Float32,2},1}

## Installation
You can download datasets using Julia's package manager
```julia
Pkg.clone("https://github.com/komartom/MIDatasets.jl.git")
```

## List of all available datasets
```julia
using MIDatasets
datasets = midatasets()
```

## Load a dataset
```julia
X, y = midataset("Musk1");
```

## Indexes for cross-validation
Each dataset also contains indexes of 5-times repeated 10-fold cross-validation for reproducible research
```julia
X, y, folds = midataset("Musk1", folds=true);

# Trainig samples and labels for the second fold of the first repetition
Xtrain = X[folds[1][2]]
ytrain = y[folds[1][2]]

# Testing samples and labels for the second fold of the first repetition
Xtest = X[.!folds[1][2]]
ytest = y[.!folds[1][2]]
```
