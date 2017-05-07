module MagicSquares

immutable MagicSquare{T<:Integer}
    data::Array{T}
end


Base.shuffle!(m::MagicSquare) = shuffle!(m.data)


function ismagical(m::MagicSquare)
    n = convert(Int, √length(m.data))
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
