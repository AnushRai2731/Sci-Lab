clc
clear

function[f,df]=fun(x)
    R = 0.518
    T = 273-40
    Pc = 4600
    Tc = 191
    a = 0.427*((R^2*Tc^2.5)/Pc)
    b = 0.0866*R*(Tc/Pc)
    p = 65000
    f=p-(R*T/(x-b))+(a/x*(x+b)*sqrt(T));
    df=(b-x)+(a*(-b+x)-R*T));
endfunction
xold=0.0001;
maxit=100;
Tol=1e-6;

r(1)=xold
for i=1:maxit
    [fx,dfx]=fun(xold);
    xnew=xold-fx/dfx;
    r(i+1)=xnew;
    eps=abs((r(i+1)-r(i))*100/r(i+1))
    if(eps<=Tol)then
            break
        end
    finalOutput=[i,r(i+1),eps]
    disp(finalOutput)
    xold=xnew;
end
v=round(xnew*10^4)/10^4;
disp("specific Volume  v=",v)  
V = 3
m = v*V
disp("mass m = ", m)
