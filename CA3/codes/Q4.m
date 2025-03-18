%3rd computer asignment, DSP
%Anaies Golboudaghians 40122113


%Q4
clc; clear; close all; close all hidden

%% Part 1
seed = 40122113; % Set the seed value for the random number generator
rng(seed);
% Generate random numbers between 0 and 9
h = randi ([0, 9], 8, 1);
x = [4; 0; 1; 2; 2; 1; 1; 3];

stem(x);
title('x[n]');
figure
stem(h);
title('h[n]');

%% Part 2
y = conv(x,h);
figure
stem(y);
title('y[n]');

%% Part 3
y_c = cconv(x,h,8);
figure
stem(y_c);
title('y_N[n]');

%% Part 4
X = fftANDplot(x);
H = fftANDplot(h);


%% Part 5
Y = X.*H;
y_d = ifft(Y);
figure
stem(y_d);
title("y_d[n]")


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