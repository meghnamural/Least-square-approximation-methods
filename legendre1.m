% Least Square Approximation using Legendre Polynomial
syms x;
f=@(x)sin((pi/2)*x);
for i=1:4
    p{i}=@(x)legendreP(i,x);
end

%Estimating the coefficients of the Legendre Polynomial
for i=1:4
    m{i}=@(x)f(x).*p{i}(x);
    l(i)=(((2*i)+1)/2)*integral(m{i},-1,1);
end    

legendre=@(x)0;

for i=1:4
    legendre=legendre+l(i).*p{i}(x);
end    
display(legendre)

%Estimating the error in the approximation
errorl=@(x)norm(f(x)-legendre(x))
for i=1:21
    z(i) = -1+(i-1)*0.1;
    t(i) = subs(errorl(1),x,z(i));
end    
% Plot with error in cubic approximation of f(x)    
plot(z,t)
title('Error in cubic approximation of f(x) for x in [-1,1]')
xlabel('x')
ylabel('Error in approximation of f(x)')