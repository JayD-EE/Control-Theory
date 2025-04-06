%% State Space Model
M = 0.5;
m = 0.1;
b = 0.01;
I = 0.006;
g = 9.8;
l = 0.3;

p = I*(M+m)+M*m*l^2; %denominator for the A and B matrices

A = [0      1              0           0;
     0 -(I+m*l^2)*b/p  (m^2*g*l^2)/p   0;
     0      0              0           1;
     0 -(m*l*b)/p       m*g*l*(M+m)/p  0];
B = [     0;
     (I+m*l^2)/p;
          0;
        m*l/p];
C = [1 0 0 0;
     0 0 1 0];
D = [0;
     0];

states = {'x' 'x_dot' 'phi' 'phi_dot'};
inputs = {'u'};
outputs = {'x'; 'phi'};

sys_ss = ss(A,B,C,D,'statename',states,'inputname',inputs,'outputname',outputs);

[y,t,x] = impulse(sys_ss);
plot(t,x);
legend('x','v','theeta','omega')

%% LQR
Q = C'*C;
Q(1,1) = 50;
Q(3,3) = 500;
Q(4,4) = 5000;
R = 1;
K = lqr(A,B,Q,R);

Ac = [(A-B*K)];
Bc = [B];
Cc = [C];
Dc = [D];

states = {'x' 'x_dot' 'phi' 'phi_dot'};
inputs = {'r'};
outputs = {'x'; 'phi'};

Cn = [1 0 0 0];
sys_ss = ss(A,B,Cn,0);
Nbar = rscale(sys_ss,K);
sys_cl = ss(Ac,Bc*Nbar,Cc,Dc,'statename',states,'inputname',inputs,'outputname',outputs);


% t = 0:0.005:1.5;
% r =.2*ones(size(t));
% [y,t,x]=lsim(sys_cl,r,t);
% 
% plot(t,y);
% legend('x','theeta')
% legend('x','v','theeta','omega')


%
% Define the time vector
t = 0:0.005:30;  % Time from 0 to 5 seconds with a time step of 0.05

% Define the initial state
x0 = [-2, 0, -1, 0];  % Initial state vector [position, velocity, angle, angular velocity]

%noise
t = 0:0.005:15;
scalar = 0;
scalar2 = 0;
low_freq_noise = scalar * (.5*sin(2*pi*0.25*t) + sin(2*pi*0.1*t) + 0.5 * randn(size(t)));
high_freq_noise = (rand(size(t)) - 0.5) * 0.4;  
earthquake_noise = scalar2*(low_freq_noise + high_freq_noise);
% plot(t, earthquake_noise);


% Simulate the system response with the initial condition
% [y, t, x] = lsim(sys_cl, zeros(length(t), 1), t, x0);  % Simulate with zero input
[y, t, x] = lsim(sys_cl, earthquake_noise, t, x0);

% Plot the results (for example, the angle and position of the pendulum)
figure;
subplot(2,1,1);
plot(t, x(:,3));  % Plot the angle (state 3)
title(['Angle with x = ', mat2str(x0)]);
xlabel('Time (seconds)');
ylabel('Angle (radians)');

subplot(2,1,2);
plot(t, x(:,1));  % Plot the position (state 1)
title('Position of the Cart');
xlabel('Time (seconds)');
ylabel('Position (meters)');

% subplot(3,1,3);
% plot(t, earthquake_noise);  % Plot the position (state 1)
% title('Earthquack Noise with scaling 2.5');
% xlabel('Time (seconds)');
% ylabel('Amplitude (meters)');

%%
figure
for k=1:10:length(t)
    drawcartpend_bw(x(k,:),m,M,l);
end

%% save it as a video
videoFile = VideoWriter('cartpendulum_animation.mp4', 'MPEG-4');
    open(videoFile);
    
    % Loop to draw the cart and pendulum at each time step
    for k = 1:10:length(t)
        % Call the drawcartpend function (assuming it's a separate function)
        drawcartpend_bw(x(k,:), m, M, l);
        
        % Capture the current frame for the video
        frame = getframe(gcf);  % Get the current figure as a frame
        writeVideo(videoFile, frame);  % Write the frame to the video file
    end
    
    % Close the video file
    close(videoFile);