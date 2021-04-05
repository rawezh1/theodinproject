def cos(a)
    sum = 0
    for i in 0..100 do
        sum += (a**2*i)/fact(2*i)
    end
    sum
end

def fact(n)
    result = 1
    for i in 0..n do
        result *= i
    end
    result
end