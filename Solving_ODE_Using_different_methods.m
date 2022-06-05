clc,clearvars,close all,format compact

 
% Solving ode using different methods

%Variables
x  = linspace(0,2,5);
y(1) = 1 ;        %yn = y1,y2,...,y5

  h = x(3) -x(2);
  %intial,x = 0 & y = 1

  % Euler's method of solving ode

  for  i= 1:4; 
    n = i;
    y(n+1) = y(n)+h.*fx(x(n),y(n));
  end
  yE = y ; % y values obtained by eulers method
  plot(x,y,'rv--')
  title('SOLVE ODE WITH DIFFERENT METHODS')
  xlabel('x')
  ylabel('y')
  
  % Heun's methode to solve ODE
  for i = 1:4;
      n = i;
      A = y(n)+h;
      B = y(n)+h*fx(x(n),y(n));
      sl = fx(x(n),y(n)); %slop left
      sr = fx(A,B) ;     % slop right
      y(n+1) = y(n)+(1/2)*h*(sl+sr);
  end
  yH = y ;   % y values obtained by heuns method
  hold on
  plot(x,y,'go--')
  

  % R-k methode to solve ODE
 for i=1:4;
     n=i;
     k1 = h*fx(x(n),y(n));
     k2 = h*fx((x(n)+(1/2)*h),(y(n)+(1/2)*k1));
     k3 = h*fx((x(n)+(1/2)*h),(y(n)+(1/2)*k2));
     k4 = h*fx((x(n)+h),(y(n) + k3));
     y(n+1) = y(n)+((1/6)*(k1+2*k2+2*k3+k4));
 end
 yRK = y ;   % y values obtained by RK method
 hold on
 plot(x,y,'bs--')
 
 % Analytical method
 
 y =( (x.^2)+(1/2)+1).^2;
 yA = y % y values obtained by analytical method
 hold on
 plot(x,y,'c*--')
 xlim([0 2])
 ylim([0 40])
 
 %Matlab built in function
 [x,y]= ode45(@fx,[0,2],[0,1]);

 hold on
 plot(x,y,'k-')
 legend('Eulers method','Hunes method','R-K method','Analytic method','Ode45 method','location','northwest')
 %gtext('dy/dx=(1+4*x)*√y')

 function  [y]= fx(x,y)  % function saved at the bottom of the script
    y = (1+4*x)*sqrt(y) 
    end


