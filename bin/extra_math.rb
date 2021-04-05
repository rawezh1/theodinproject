def cos(a)
    sum = 0
    for i in 0..100 do
        sum += (a**2*i)/fact(2*i)
    end
    sum
end

