function x1 = iter(A, c, x0, count)
    x1 = c - A*x0;
    e  = mean(sqrt((x1 - x0).^2));
    
    if  e > 10e-6 && count < 15
        count = count + 1;
        x1 = iter(A, c ,x1, count);
    end
end