% This scrips attemps to reproduce the figures (S.Génieys, V.Volpert,P.Auger, 2006) 
close all; clearvars; 

% Parameters (symmetric)
a = 1;K = 1; b = 3 ; d1 = 0.05; L = 40; 

% Discretization 
N = 400;
dx = L/N;
x = -L/2:dx:L/2;                    % Spatial discretization
dt = 0.02; tend = 80;               % Time discretization 
cfl1 = d1*dt/dx^2;                  % CFL Condition
phi1 = (1/(2*b))*(x>= -b & x<=b);   % Competition Kernel (symmetric)
U1 = zeros(length(0:dt:tend),N+1);  % Preacllocate space to save solution
f1 = exp(-((x).^2)/(2*0.04));       % Initial Conditions (f =K slightly perturbed)
%% Finite Difference Scheme
counter = 1; i=2:N; %Internal grid points
for t=dt:dt:tend
    fn = f1;v1 = dx*conv(fn,phi1,'same');conv_term1 = dt*a*fn.*(K-v1);   
    % Explicit FD  
    fn(i) = fn(i) + (cfl1)*(fn(i+1)-2*fn(i)+fn(i-1)) + conv_term1(i);
    %Periodic Boundary condition
    fn(N+1) = fn(1);    
    % Plot solution at every time 10th time step
    if (mod(counter,10)==0)    
        figure(1)      
        h1=plot(x,fn,'Linewidth',2);       %plotting the velocity profile
        title({['1-D Diffusion with \nu =',num2str(d1),' and \beta = ',num2str(cfl1)];['time(\itt) = ',num2str(dt*counter)]})
        xlabel('Spatial co-ordinate (x) \rightarrow'); ylabel('Transport property profile (u) \rightarrow')
        drawnow; refreshdata(h1); 
    end
    f1 = fn; U1(counter+1,:) = f1; counter = counter + 1;
end

%% Figures
figure(3)
t = 0:dt:tend;[xmesh, tmesh] = meshgrid(linspace(0,L,N+1),0:dt:tend);
subplot(1,2,1);plot(linspace(0,L,N+1), f1)
title('Population at final time');xlabel('x');ylabel('P');
subplot(1,2,2) %%%% contour plot %%%
s = surf(xmesh, tmesh, U1); set(s, 'EdgeColor', 'none', 'FaceColor', 'interp');
p = pcolor(xmesh,tmesh , U1); set(p, 'EdgeColor', 'none', 'FaceColor', 'interp');
xlabel('x'); ylabel('t'); zlabel('P');title('Evolution of trait x over time')

figure(4)
s = surf(xmesh, tmesh, U1); set(s, 'EdgeColor', 'none', 'FaceColor', 'interp');
p = pcolor(xmesh,tmesh , U1); set(p, 'EdgeColor', 'none', 'FaceColor', 'interp');
xlabel('x'); ylabel('t'); zlabel('P');title('Evolution of trait x over time')
