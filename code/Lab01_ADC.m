% Lab01 Analog-to-digital converting

% Sampling
fs = 100; % 샘플링 주파수
fi = 2; % 아날로그 신호의 최대 주파수 설정
delta = 1/fs; % 샘플링 주기

x = 0:delta:1; % x 영역의 범위
fx = cos(2*pi*fi*x); % 최소 = -1, 최대 = +1

figure(1);
plot(x, fx, 'b.-');
axis([0,1,-1.1, 1.1]);
title('cos function');

% Quantization
qbit = 6; % 양자화 비트수
maxval = 2^(qbit-1)-1; % -31 ~ 31
fxq = round(maxval*fx);

figure(2);
stem(x,fxq,'.');

% inverse Quantization
fxr = fxq/maxval;
fxe = fx- fxr;
errpow = mean(fxe.^2);

figure(3);
plot(x, fx, 'b-', x, fxr, 'r-');
axis([0,1,-1.1, 1.1]);
title(['cos function, frequency=', num2str(fi)]);

figure(4);
stem(x,fxe,'.');
title(['Error function, Power=', num2str(errpow*1000)]);