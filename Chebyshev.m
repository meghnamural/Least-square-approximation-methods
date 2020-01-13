%Least Square Approximation using Chebyshev Polynomial
syms x
f=@(x)sin((pi/2)*x);
for i=1:4
    t{i}=@(x)cos(i*(acos(x)));
end

%Estimating the coefficients of the Chebyshev Polynomial 
for i=1:4
    m{i}=@(x)f(x).*t{i}(x);
    c(i)=2/pi*integral(m{i},-1,1);
end    

cheby=@(x)0;
for i=1:4
    cheby=cheby+c(i)*t{i}(x);
end    
display(cheby)

%Error in estimation
errorc=@(x)norm(f(x)-cheby(x),inf)
for i=1:21
    z(i) = -1+(i-1)*0.1;
    p(i) = subs(errorc(1),x,z(i));
end    

%Plot with error in cubic approximation of f(x)
plot(z,p)
title('Error in cubic approximation of f(x) for x in [-1,1]')
xlabel('x')
ylabel('Error in approximation of f(x)')