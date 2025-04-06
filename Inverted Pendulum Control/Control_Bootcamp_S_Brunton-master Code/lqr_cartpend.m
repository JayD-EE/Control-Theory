clear all, close all, clc

m = 1;
M = 5;
L = 2;
g = -10;
d = 1;

s = 1; % pendulum up (s=1)

A = [0 1 0 0;
    0 -d/M -m*g/M 0;
    0 0 0 1;
    0 -s*d/(M*L) -s*(m+M)*g/(M*L) 0];



B = [0; 1/M; 0; s*1/(M*L)];
eig(A)

Q = [1 0 0 0;
    0 1 0 0;
    0 0 10 0;
    0 0 0 100];
R = .0001;

%%
det(ctrb(A,B))


K = lqr(A,B,Q,R);

%%
tspan = 0:.001:7;
if(s==-1)
    y0 = [0; 0; 0; 0];
    [t,y] = ode45(@(t,y)cartpend(y,m,M,L,g,d,-K*(y-[4; 0; 0; 0])),tspan,y0);
elseif(s==1)
    y0 = [0; 0; pi-.5; 0];
    [t,y] = ode45(@(t,y)cartpend(y,m,M,L,g,d,-K*(y-[1; 0; pi; 0])),tspan,y0);
else
    
end
%% play
for k=1:10:length(t)
    drawcartpend(y(k,:),m,M,L);
end

%% function dy = pendcart(y,m,M,L,g,d,u)
plot(t,y(:,1));
hold on;
plot(t,y(:,3));
legend('x','theeta')