function [fx, x] = sigHatTrain(range,delta)
% 이 함수는 삼각파 형태의 신호를 생성합니다.
% [fx, x] = sighatTrain(range,delta)

if nargin == 1; delta = 0.01; end
if nargin == 0; delta = 0.01; range=4; end

xu = -0.5:delta:0.5-delta; % 한 주기에 해당하는 정의역
fxu = 1-2*abs(xu); % 1-2|x| % 한 주기에 해당하는 함수

x = -range:delta:range-delta;
len = length(x);

lenxu = length(xu); % 한 주기의 샘플수, 크기
% len = lenxu*range*2;

ftri = zeros(1,len);
for n=1:range*2
    ftri(1+(n-1)*lenxu:n*lenxu) = fxu;
    %ftri = [ftri, fxu];
end
fx = ftri

if nargout == 0
    plot(x,fx,'k-');
end