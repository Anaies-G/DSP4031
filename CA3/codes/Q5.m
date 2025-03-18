%3rd computer asignment, DSP
%Anaies Golboudaghians 40122113

%Q7
clc; clear; close all; close all hidden

n = 0:255;
s = cos((pi*5).*n./32) + cos((pi*21).*n./64);

e = sqrt(0.3)*randn(1,256);
x = s+e;

%% Part 1
E = sum((x-s).^2);
disp(E);

%% Part 2
S = fftANDplot(s);
X = fftANDplot(x);

for k=1:length(S)
    if S(k)~=0
        S_nz(k)=k;
    end
end

%% Part 3
for k=1:length(X)
    if ismember(k,S_nz)
        X_h(k)= X(k);
    else
        X_h(k)= 0;
    end
end

x_h = ifft(X_h);
figure
stem(x_h);

E_h = sum((x_h-s).^2);
disp(E_h);


function X = fftANDplot(x)
    X = fft(x);
    figure
    % w_sample=1/length(x)*(0:length(x)-1);
    subplot(1,2,1)
    stem(abs(X),"LineWidth",1);
    xlabel('\omega');
    ylabel('|H(e^{j\omega})|')
    hold on
    subplot(1,2,2)
    stem(angle(X),"LineWidth",1);
    xlabel('\omega');
    ylabel('arg(H(e^{j\omega}))')
end