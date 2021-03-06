clc 
clear

% % must run simulink before each problem and it's parameters
% %1b)
% plot(simout.Time, simout.Data);
% 3-max(simout.Data)
% 
% %1d)
% plot(simout.Time, simout.Data);
% 0-min(simout.Data)
% 
% 
% %1f)
% plot(simout.Time, simout.Data);
% 3 - max(simout.Data);

%2)

%https://www.youtube.com/watch?v=eTVddYCeiKI
%http://ctms.engin.umich.edu/CTMS/index.php?example=Introduction&section=ControlRootLocus    
%a
%Determining transfer function
syms s 
G_coef = (poly([0 -3 -7 -8]));
G = 1/(s^4+18*s^3+101*s^2+168*s);
H = (s+30)/(s^2+20*s+200);
T = G/(1+G*H);
%making the transfer function
s = tf('s');
T = ((s^2+20*s+200)/(s^6+38*s^5+661*s^4+5788*s^3+23560*s^2+33601*s+30));
rlocus(T);
pause;
%b
axis([-2 2 -2 2]);
pause;
%c
zeta = .707;
Wn = 2;
sgrid(zeta,1.8);
%d
k = rlocfind(T);
%e
closed = feedback(k*T,1);
step(closed);
