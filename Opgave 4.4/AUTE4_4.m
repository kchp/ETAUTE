clear, close all, clc;
%% Load signals

load ('plant.mat');
g = d;

[sound,fs] = audioread('When It Comes To You_11s.wav');
sound = sound';

f = 650;
T = 1/f;

Ts = 1/fs;

N = 5000;
n = 0:N-1;
Td = N/fs;

noise = randn(N);
sinus = 1*sin(2*pi*f/fs*n);

% Antal filtre
M1 = 80;
M2 = 200;
M3 = 500;

% step size
mu = 1;

%% LMS algoritme med støj signal

[hn1,e1,h_sto1] = lmssimNY(M1,mu,noise);
[hn2,e2,h_sto2] = lmssimNY(M2,mu,noise);
[hn3,e3,h_sto3] = lmssimNY(M3,mu,noise);

% plot af resultater (5000 samples, 80 koefficienter, 1 step, støj)
figure(1); clf
subplot(2,2,1), plot(e1.^2)
title('e^2(n) (noise)'), xlabel('n'), ylabel('e^2(n)')
subplot(2,2,2), plot(h_sto1')
title('Konvergens (noise)'), xlabel('n')
subplot(2,2,3), plot(hn1)
hold on
plot(g,'r')
title('Endelige filterkoefficienter (noise)'), xlabel('n')
grid minor, legend('h','plant')
subplot(2,2,4), plot(hn1(1:5))
hold on
plot(g(1:5),'r--o')
title('Første 4 filterkoefficienter (noise)'), xlabel('n')
grid minor, legend('h','plant')

% plot af resultater (5000 samples, 200 koefficienter, 1 step, støj)
figure(2); clf
subplot(2,2,1), plot(e2.^2)
title('e^2(n) (noise)'), xlabel('n'), ylabel('e^2(n)')
subplot(2,2,2), plot(h_sto2')
title('Konvergens (noise)'), xlabel('n')
subplot(2,2,3), plot(hn2)
hold on
plot(g,'r')
title('Endelige filterkoefficienter (noise)'), xlabel('n')
grid minor, legend('h','plant')
subplot(2,2,4), plot(hn2(76:80))
hold on
plot(g(1:5),'r--o')
title('Første 4 filterkoefficienter (noise)'), xlabel('n')
grid minor, legend('h','plant')

% plot af resultater (5000 samples, 500 koefficienter, 1 step, støj)
figure(3); clf
subplot(2,2,1), plot(e3.^2)
title('e^2(n) (noise)'), xlabel('n'), ylabel('e^2(n)')
subplot(2,2,2), plot(h_sto3')
title('Konvergens (noise)'), xlabel('n')
subplot(2,2,3), plot(hn3)
hold on
plot(g,'r')
title('Endelige filterkoefficienter'), xlabel('n')
grid minor, legend('h','plant')
subplot(2,2,4), plot(hn3(376:380))
hold on
plot(g(1:5),'r--o')
title('Første 4 filterkoefficienter (noise)'), xlabel('n')
grid minor, legend('h','plant')

%% LMS algoritme med sinus signal

[hsin1,esin1,hsin_sto1] = lmssimNY(M1,mu,sinus);
[hsin2,esin2,hsin_sto2] = lmssimNY(M2,mu,sinus);
[hsin3,esin3,hsin_sto3] = lmssimNY(M3,mu,sinus);

% plot af resultater (5000 samples, 80 koefficienter, 1 step, sinus)
figure(4); clf
subplot(2,2,1), plot(esin1.^2)
title('e^2(n) (sinus)'), xlabel('n'), ylabel('e^2(n)')
subplot(2,2,2), plot(hsin_sto1')
title('Konvergens (sinus)'), xlabel('n')
subplot(2,2,3), plot(hsin1)
hold on
plot(g,'r')
title('Endelige filterkoefficienter (sinus)'), xlabel('n')
grid minor, legend('h','plant')
subplot(2,2,4), plot(hsin1(1:5))
hold on
plot(g(1:5),'r--o')
title('Første 4 filterkoefficienter (sinus)'), xlabel('n')
grid minor, legend('h','plant')

% plot af resultater (5000 samples, 200 koefficienter, 1 step, sinus)
figure(5); clf
subplot(2,2,1), plot(esin2.^2)
title('e^2(n) (sinus)'), xlabel('n'), ylabel('e^2(n)')
subplot(2,2,2), plot(hsin_sto2')
title('Konvergens (sinus)'), xlabel('n')
subplot(2,2,3), plot(hsin2)
hold on
plot(g,'r')
title('Endelige filterkoefficienter (sinus)'), xlabel('n')
grid minor, legend('h','plant')
subplot(2,2,4), plot(hsin2(76:80))
hold on
plot(g(1:5),'r--o')
title('Første 4 filterkoefficienter (sinus)'), xlabel('n')
grid minor, legend('h','plant')

% plot af resultater (5000 samples, 500 koefficienter, 1 step, sinus)
figure(6); clf
subplot(2,2,1), plot(esin3.^2)
title('e^2(n) (sinus)'), xlabel('n'), ylabel('e^2(n)')
subplot(2,2,2), plot(hsin_sto3')
title('Konvergens (sinus)'), xlabel('n')
subplot(2,2,3), plot(hsin3)
hold on
plot(g,'r')
title('Endelige filterkoefficienter (sinus)'), xlabel('n')
grid minor, legend('h','plant')
subplot(2,2,4), plot(hsin3(376:380))
hold on
plot(g(1:5),'r--o')
title('Første 4 filterkoefficienter (sinus)'), xlabel('n')
grid minor, legend('h','plant')

%% LMS algoritme med støj signal

[hsnd1,esnd1,hsnd_sto1] = lmssimNY(M1,mu,sound);
[hsnd2,esnd2,hsnd_sto2] = lmssimNY(M2,mu,sound);
[hsnd3,esnd3,hsnd_sto3] = lmssimNY(M3,mu,sound);

% plot af resultater (5000 samples, 500 koefficienter, 1 step, sound)
figure(7); clf
subplot(2,2,1), plot(esnd1.^2)
title('e^2(n) (sound)'), xlabel('n'), ylabel('e^2(n)')
subplot(2,2,2), plot(hsnd_sto1')
title('Konvergens (sound)'), xlabel('n')
subplot(2,2,3), plot(hsnd1)
hold on
plot(g,'r')
title('Endelige filterkoefficienter (sound)'), xlabel('n')
grid minor, legend('h','plant')
subplot(2,2,4), plot(hsnd1(1:5))
hold on
plot(g(1:5),'r--o')
title('Første 4 filterkoefficienter (sound)'), xlabel('n')
grid minor, legend('h','plant')

% plot af resultater (5000 samples, 500 koefficienter, 1 step, sound)
figure(8); clf
subplot(2,2,1), plot(esnd2.^2)
title('e^2(n) (sound)'), xlabel('n'), ylabel('e^2(n)')
subplot(2,2,2), plot(hsnd_sto2')
title('Konvergens (sound)'), xlabel('n')
subplot(2,2,3), plot(hsnd2)
hold on
plot(g,'r')
title('Endelige filterkoefficienter (sound)'), xlabel('n')
grid minor, legend('h','plant')
subplot(2,2,4), plot(hsnd2(76:80))
hold on
plot(g(1:5),'r--o')
title('Første 4 filterkoefficienter (sound)'), xlabel('n')
grid minor, legend('h','plant')

% plot af resultater (5000 samples, 500 koefficienter, 1 step, sound)
figure(9); clf
subplot(2,2,1), plot(esnd3.^2)
title('e^2(n) (sound)'), xlabel('n'), ylabel('e^2(n)')
subplot(2,2,2), plot(hsnd_sto3')
title('Konvergens (sound)'), xlabel('n')
subplot(2,2,3), plot(hsnd3)
hold on
plot(g,'r')
title('Endelige filterkoefficienter (sound)'), xlabel('n')
grid minor, legend('h','plant')
subplot(2,2,4), plot(hsnd3(376:380))
hold on
plot(g(1:5),'r--o')
title('Første 4 filterkoefficienter (sound)'), xlabel('n')
grid minor, legend('h','plant')
