% 주기함수를 생성하는 실습
 
% sampling
delta = 0.01; % fs = 1/delta
range = 5;
f0 = 1; % 기본주기 = 1
 
% x 영역
x = -range:delta:range-delta;

fc = (cos(2*pi*x)+1)/2;

% 임펄스꼴의 주기함수
w = 0.99999;
fr = fc >= w;
figure(3);
plot(x,fr,'b');

fc = cos(2*pi*x);
figure(1);
plot(x, fc, 'b');

% 사각펄스 주기함수
fr = sign(fc);
figure(2);
plot(x,fr,'b');
 
% 삼각파 함수
delta = 0.01;
xu = -0.5:delta:0.5-delta;
fxu = 1-2*abs(xu); % 1-2|x| 
figure(4);
plot(xu, fxu, 'b-');

% 삼각파 주기함수
ftri = [];
for n=1:10
    ftri = [ftri, fxu];
end
figure(5);
stem(ftri, '.');

% sigHatTrain을 이용한 삼각파 주기함수
[ftri,x] = sigHatTrain(5, 0.01);
figure(6);
stem(x,ftri, '.');