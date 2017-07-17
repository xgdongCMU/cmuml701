function K = kernel(x1,x2,select,d,lambda)
n = length(x1);
m = length(x2);

K = zeros(n,m);
alpha = 2;

if  select == 1
    for i = 1 : n
        for j = 1:m
            K(i,j) = x1(i)*x2(j);
        end
    end
elseif select == 2
    for i = 1 : n
        for j = 1:m
            K(i,j) = (x1(i)*x2(j))^d;
        end
    end
elseif select == 3
    for i = 1 : n
        for j = 1:m
            K(i,j) = exp(-(x1(i)-x2(j))^2/2/lambda^2);
        end
    end
elseif select == 4
    for i = 1 : n
        for j = 1:m
            K(i,j) = exp(-abs(x1(i)-x2(j))/lambda);
        end
    end 
elseif select == 5
    for i = 1 : n
        for j = 1:m
            K(i,j) = exp(-2/lambda^2*sin(abs(x1(i)-x2(j))/2)^2);
        end
    end
    
elseif select == 6
    for i = 1 : n
        for j = 1:m
            K(i,j) = 1+ (x1(i)-x2(j))^(-alpha);
        end
    end
    
end