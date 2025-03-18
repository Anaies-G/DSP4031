%3rd computer asignment, DSP
%Anaies Golboudaghians 40122113


%Q1
clc; clear; close all; close all hidden

x1 = [1 0 0 0 0 0 0 1];
fftANDplot(x1);
title('X_1');

x2 = [0 1 1 0 0 0 -1 -1];
fftANDplot(x2);
title("X_2")

x3 = [1 1 1 1 1 1 1 1];
fftANDplot(x3);
title("X_3")


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