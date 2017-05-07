module MagicSquares

immutable MagicSquare{T, N}
#    data = Array{T, 2}(N, N)
    data = zeros(T, N, N)
end

end # module
