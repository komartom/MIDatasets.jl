module MIDatasets

using JLD

export list, midataset


const DATA_LOCATION = joinpath(dirname(@__FILE__), "..", "data")


function list()
    [filename[1:end-4] for filename in filter!(r"jld$", readdir(DATA_LOCATION))]
end


function midataset(name::AbstractString; folds=false)

    filename = joinpath(DATA_LOCATION, string(name, ".jld"))

    if !isfile(filename)
        error(@sprintf("Unable to locate dataset %s.", name))
    end

    if folds
        load(filename, "X", "y", "folds")
    else
        load(filename, "X", "y")
    end

end

end
