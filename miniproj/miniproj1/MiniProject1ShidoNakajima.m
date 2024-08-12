% BMEN 3302.501
% Shido Nakajima
% MiniProject 1

clear;clc;

% coordinates
xr = 0; yr = 10;
xref = 5; yref = 10;
xt = [0, 2.5, 7.5, 10]; yt = 0;

% signal
T = 2/3/10^8;
t = 0:pi/10^10:5*T;
st = cos(3*10^8*pi*t);

% distance
drt = sqrt((yt-yr)^2+(xt-xr).^2);
drref = 5;
dreft = sqrt((yt-yref)^2+(xt-xref).^2);
drreft = drref+dreft;

% delay
trt = drt/3/10^8;
trreft = drreft/3/10^8;

% r(t) for xt = 0
strt0 = cos(3*10^8*pi*(t-trt(1)));
strreft0 = cos(3*10^8*pi*(t-trreft(1)));
rt0 = strt0+strreft0;

% r(t) for xt = 2.5
strt2 = cos(3*10^8*pi*(t-trt(2)));
strreft2 = cos(3*10^8*pi*(t-trreft(2)));
rt2 = strt2+strreft2;

% r(t) for xt = 7.5
strt7 = cos(3*10^8*pi*(t-trt(3)));
strreft7 = cos(3*10^8*pi*(t-trreft(3)));
rt7 = strt7+strreft7;

% r(t) for xt = 10
strt10 = cos(3*10^8*pi*(t-trt(4)));
strreft10 = cos(3*10^8*pi*(t-trreft(4)));
rt10 = strt10+strreft10;

% plot 4 subplots
subplot(2,2,1);
plot(t,st,'b',t,rt0,'g')
title('Subplot for xt = 0')
ylabel('Amplitude')
xlabel('time')
legend('s(t)','r(t)')

subplot(2,2,2);
plot(t,st,'b',t,rt2,'g')
title('Subplot for xt = 2.5')
ylabel('Amplitude')
xlabel('time')
legend('s(t)','r(t)')

subplot(2,2,3);
plot(t,st,'b',t,rt7,'g')
title('Subplot for xt = 7.5')
ylabel('Amplitude')
xlabel('time')
legend('s(t)','r(t)')

subplot(2,2,4);
plot(t,st,'b',t,rt10,'g')
title('Subplot for xt = 10')
ylabel('Amplitude')
xlabel('time')
legend('s(t)','r(t)')