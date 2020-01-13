function [fnew,jacobian]=newton(X)
x=X(1);
y=X(2);
%Updating values for x and y
fnew(1,1)=x^2+y^2-4;
fnew(2,1)=x^2-y^2-1;

%Computing the Jacobian Matrix
jacobian=[2*x,2*y;
          2*x,-2*y]  
