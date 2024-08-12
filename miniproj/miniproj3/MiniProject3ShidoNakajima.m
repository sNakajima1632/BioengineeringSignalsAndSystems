% BMEN 3302.501
% Shido Nakajima
% MiniProject 3

clear;clc;close all;

% load nosy ECG
xNoisy = load("noisyECGMiniProject3.mat").noisyECG;
t = load("noisyECGMiniProject3.mat").t;

% Ts and Fs
Ts = sum(diff(t))/(length(t)-1);
Fs = round(1/Ts);

% magnitude spectrum
freq = (-300+Fs/length(t):Fs/length(t):300);
fourier = fft(xNoisy);
xMag = abs(fftshift(fourier));

% filters
xMagFilt = xMag;
%{
% low/high pass
xMagFilt(1:750) = 0;
xMagFilt(2250:end) = 0;
% bandreject
xMagFilt(599:603) = 0;
xMagFilt(898:905) = 0;
xMagFilt(1199:1203) = 0;
xMagFilt(1501) = 0;
xMagFilt(1799:1803) = 0;
xMagFilt(2097:2104) = 0;
xMagFilt(2396:2403) = 0;
%}

[temp,findex] = rmoutliers(xMagFilt,'movmedian',30);
xMagFilt(findex) = 0;

% inverse fourier
xClean = ifft(ifftshift(xMag));

figure(1)
% noisy ECG
subplot(2,2,1)
plot(t,xNoisy)
xlabel('Time (sec)','FontSize',12,'FontWeight','bold')
ylabel('ECG Signal','FontSize',12,'FontWeight','bold')
ylim([-100,450])
title('Noisy ECG')
% magnitude spectrum
subplot(2,2,2)
plot(freq,xMag)
xlabel('Frequency (Hz)','FontSize',12,'FontWeight','bold')
ylabel('Magnitude Spectrum','FontSize',12,'FontWeight','bold')
ylim([0,2*10^4])
title('Magnitude Spectrum')
% filtered ECG
subplot(2,2,3)
plot(t,xClean)
xlabel('Time (sec)','FontSize',12,'FontWeight','bold')
ylabel('ECG Signal','FontSize',12,'FontWeight','bold')
ylim([-100,450])
title('Filtered ECG')
% filtered magnitude spectrum
subplot(2,2,4)
plot(freq,xMagFilt)
xlabel('Frequency (Hz)','FontSize',12,'FontWeight','bold')
ylabel('Filtered Magnitude Spectrum','FontSize',12,'FontWeight','bold')
ylim([0,2*10^4])
title('Filtered Magnitude Spectrum')