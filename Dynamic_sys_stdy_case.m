clear; clc; close all;

% ===== Parameter Motor 
Ra = 0.7;          % Ohm
La = 1.3e-3;       % Henry
Kb = 0.14;         % V/(rad/s)
Kt = 0.14;         % Nm/A
JW = 2.9e-7;       % kg m^2
zetaW = 0.01;      % viscous friction

% ===== Waktu 
tspan = [0 7];

% =====  input +5 V pulse 
[t1, x1] = ode45(@(t,x) motor_ode(t,x,Ra,La,Kb,Kt,JW,zetaW,+5), tspan, [0;0]);

% =====  input -5 V pulse 
[t2, x2] = ode45(@(t,x) motor_ode(t,x,Ra,La,Kb,Kt,JW,zetaW,-5), tspan, [0;0]);

% ===== Output 
i1 = x1(:,1);   omega1 = x1(:,2);
ea1 = Kb*omega1;
tau1 = Kt*i1;

i2 = x2(:,1);   omega2 = x2(:,2);
ea2 = Kb*omega2;
tau2 = Kt*i2;

%% ============================== 
%       FIGURE 1 : +5 V
figure("Name","+5 Volt Pulse");

subplot(3,1,1)
plot(t1, tau1, 'r', 'LineWidth', 1.5);
title('Torsi (\tau_{Wij})');
grid on; ylabel('Torque (Nm)');
title('Response Motor DC - Input +5 V');
legend('Torsi (+5V)');

subplot(3,1,2)
plot(t1, omega1, 'b', 'LineWidth', 1.5);
title('Kecepatan Angular (\omega_{Wij})');
grid on; ylabel('\omega (rad/s)');
legend('\omega (+5V)');

subplot(3,1,3)
plot(t1, ea1, 'm', 'LineWidth', 1.5);
title('Back EMF (\epsilon_{aij})');
grid on; ylabel('Back EMF (V)');
xlabel('Time (s)');
legend('EMF (+5V)');


%% ============================== 
%       FIGURE 2 : -5 V
figure("Name","-5 Volt Pulse");

subplot(3,1,1)
plot(t2, tau2, 'r', 'LineWidth', 1.5);
title('Torsi (\tau_{Wij})');
grid on; ylabel('Torque (Nm)');
title('Response Motor DC - Input -5 V');
legend('Torsi (-5V)');

subplot(3,1,2)
plot(t2, omega2, 'b', 'LineWidth', 1.5);
title('Kecepatan Angular (\omega_{Wij})');
grid on; ylabel('\omega (rad/s)');
legend('\omega (-5V)');

subplot(3,1,3)
plot(t2, ea2, 'm', 'LineWidth', 1.5);
title('Back EMF (\epsilon_{aij})');
grid on; ylabel('Back EMF (V)');
xlabel('Time (s)');
legend('EMF (-5V)');
