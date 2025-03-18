%3rd computer asignment, DSP
%Anaies Golboudaghians 40122113


%Q2
clc; clear; close all; close all hidden

%% Part 1
n = 0:19;
x= 0.5.*(1-cos(pi.*n./20));
zs = zeros(1,12);
x1 = [x, zs];
fftANDplot(x1);

zs = zeros(1,236);
x2 = [x, zs];
fftANDplot(x2);

%% Part 2
zs = zeros(1,16);
x3 = [zs, x];
fftANDplot(x);

function fftANDplot(x)
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