%3rd computer asignment, DSP
%Anaies Golboudaghians 40122113

%Q3
clc; clear; close all; close all hidden

n =0:31;

x1 = cos((3*pi).*n./8);
x2 = cos((3*pi).*n./16);
x3 = cos((3*pi).*n./17);

fftANDplot(x1);
fftANDplot(x2);
fftANDplot(x3);

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