%% Step 5: 2D Diffusion
clc
clear all

Lx = 2;
Ly = 2;
nx = 50;
ny = 50;
dx = Lx/(nx-1);
dy = Ly/(ny-1);

for i = 1:nx
   for j = 1:ny
        x(i,j) = (i-1)*dx;
        y(i,j) = (j-1)*dy;
   end
end
nt = 100;
% r = 0.5;
sigma=0.25;
nu = 0.05;
% dt = (r*dx^2)/nu;
dt = (sigma * dx * dy) /nu
%% Pre allocation 
u=ones(nx,ny);

%% Initial Condition
for i= 1:nx
    
    for j =1:ny
        if x(i,j) >= 0.5 && x(i,j) <= 1 && y(i,j)>=0.5 && y(i,j)<=1 
            u(i,j)=2;
            
        else
            u(i,j)=1;
           
        end
            
    end
    
end
%% Computation
t=1;

while t<=nt
    u1=u;
    for i = 2:nx-1
        for j = 2:ny-1
            u(i,j) = u1(i,j)+nu*(dt/(dx^2))*(u1(i+1,j)-2*u1(i,j)+u1(i-1,j)) + nu*(dt/(dy^2))*(u1(i,j+1)-2*u1(i,j)+u1(i,j-1)) ;                            
        end
        
    end
    t=t+1;
    surf(x,y,u)
    pause(0.1)
end
