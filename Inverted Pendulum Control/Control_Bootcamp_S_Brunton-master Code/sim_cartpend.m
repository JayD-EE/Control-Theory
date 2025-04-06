clear all, close all, clc

m = 1;
M = 5;
l = 2;
g = -10;
b = 10;

% M = 0.5;
% m = 0.2;
% b = 0.1;
% I = 0.006;
% g = 9.8;
% l = 0.3;

tspan = 0:.1:40;
y0 = [0; 0; pi; .5];
[t,y] = ode45(@(t,y)cartpend(y,m,M,l,g,b,0),tspan,y0);

% function dy = pendcart(y,m,M,L,g,d,u)
plot(t,y)
legend('x','v','theeta','omega')

%%
figure
for k=1:length(t)
    drawcartpend_bw(y(k,:),m,M,l);
end


