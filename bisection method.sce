clc
clear
function return_value=f(x)

    return_value=x**3-(0.165*x**2)+(3.993*10**-4)
endfunction
disp("sample input :bisectionMethod(1,2,10^-4,100)")
function bisectionMethod(xl,xu,tol,N)
    i=1
    xm=(xl+xu)/2
    fxl=f(xl)
    fxu=f(xu)
    if(fxl*fxu>0)then
        break
    end
    disp("n     xl_n      xu_n    eps")
    r(1)=xm
    for i=1:N
        fxm=f(xm)
        if(fxl*fxm<0)then
            xu=xm
            xl=xl
         else
             xl=xm
             xu=xu
          end
          r(i+1)=(xl+xu)/2
          xm=r(i+1)
          eps=abs((r(i+1)-r(i))*100/r(i+1))
          finaloutput=[i,xl,xu,xm,eps]
          
          disp(finaloutput)
          
          if(eps<=tol)then
              break
           end
    end
endfunction
