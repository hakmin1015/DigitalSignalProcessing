% 디지털 영역에서의 미적분
clear all;

% Sampling cos sin
fs = 100;
delta = 2*pi/fs;
x = 0:delta:2*pi;

ys = sin(x);
yc = cos(x);

figure(1);
plot(x,ys,'b', x, yc, 'r');

% 이산 신호 미분
dys = diff([0,ys])/(delta); % (f(x+h)-f(x))/h
figure(2);
plot(x,ys, 'b', x, dys, 'r');


% 이산 신호 적분

iyc = cumsum(yc)*delta;
figure(3);
plot(x,yc, 'b', x, iyc, 'r');