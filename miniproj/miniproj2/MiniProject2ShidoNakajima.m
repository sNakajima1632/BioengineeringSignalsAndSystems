% BMEN 3302.501
% Shido Nakajima
% MiniProject 2

clear;clc;close all;

N = 5000;
xClean = load("MiniProject2cleanECG.mat").ECG;
xNoisy = load("MiniProject2noisyECG.mat").noisyECG;
n = load("MiniProject2cleanECG.mat").time;
yNoisy = zeros(1,200);
h = zeros(1,N);
yConv = zeros(1,200);

yNoisy = movmean(xNoisy,[N-1 0]);

for i = 0:N-1
    h(i+1) = 1/N;
end
yConv = conv(xNoisy,h);
for i = 1:N-1
    yConv(length(yConv)) = [];
end

figure(1)
% clean ECG
subplot(4,1,1)
stem(n,xClean)
xlabel('n','FontSize',12,'FontWeight','bold')
ylabel('Clean ECG','FontSize',12,'FontWeight','bold')
ylim([0,5])
% noisy ECG
subplot(4,1,2)
stem(n,xNoisy)
xlabel('n','FontSize',12,'FontWeight','bold')
ylabel('Noisy ECG','FontSize',12,'FontWeight','bold')
ylim([0,5])
% moving average noisy ECG
subplot(4,1,3)
stem(n,yNoisy)
xlabel('n','FontSize',12,'FontWeight','bold')
ylabel('Moving Average of Noisy ECG','FontSize',12,'FontWeight','bold')
ylim([0,5])
% moving average noisy ECG
subplot(4,1,4)
stem(n,yConv)
xlabel('n','FontSize',12,'FontWeight','bold')
ylabel('Convolution of Noisy ECG and impulse response','FontSize',12,'FontWeight','bold')
ylim([0,5])

% Bio signal
bio = load("MiniProject2ShidoNakajima.mat").ECG;
t = load("MiniProject2ShidoNakajima.mat").t;
index = round(length(bio)/5):length(bio);
bio(index) = [];
t(index) = [];

% Noisy Bio signal
figure(2)
subplot(2,1,1)
stem(t,bio)
xlabel('t','FontSize',12,'FontWeight','bold')
ylabel('Noisy Bio Signal','FontSize',12,'FontWeight','bold')
ylim([-1,5])

% apply moving average
bio = movmean(bio,[N-1 0]);

% moving average noisy bio
subplot(2,1,2)
stem(t,bio)
xlabel('t','FontSize',12,'FontWeight','bold')
ylabel('Moving Average of Noisy Bio Signal','FontSize',12,'FontWeight','bold')
ylim([-1,5])