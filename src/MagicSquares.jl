module MagicSquares

export MagicSquare, ismagical

immutable MagicSquare{T<:Integer}
    n::Integer
    data::Array{T}

    MagicSquare(data::Array{T}) = begin
        n = convert(Int, √length(data))
        new(n, data)
    end
end

MagicSquare{T <: Integer}(data::Array{T}) = MagicSquare{T}(data)
MagicSquare{T <: Integer}(n::T) = MagicSquare{T}(zeros(T, n*n))


Base.shuffle!(m::MagicSquare) = shuffle!(m.data)
Base.show(io::IO, m::MagicSquare) = begin
    if(ismagical(m))
        println("Magic square with sum=$(sum(m.data[1:m.n]))")
    else
        println("Non-magic square.")
    arr = reshape(m.data, m.n, m.n)
    for i ∈ 1:m.n
        println(io, arr[i, :])
    end
end


function ismagical(m::MagicSquare)
    n = m.n
    s = sum(m.data[1:n])
    data1 = reshape(m.data, n, n)
    data2 = data1'
    diagsum1 = s
    diagsum2 = s
    for i ∈ 1:n
        if(s != sum(data1[i, :]) || s != sum(data2[i, :]))
            return false
        end
        diagsum1 -= data1[i, i]
        diagsum2 -= data1[i, n-i+1]
    end
    if diagsum1 == 0 && diagsum2 == 0
        return true
    end
    return false
end


end # module
