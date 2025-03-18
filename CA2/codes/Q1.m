%2nd computer asignment, DSP
%Anaies Golboudaghians 40122113
%Q1
%% Part 1
clc; clear; close all; close all hidden

R_p = 0.25;
A_s = 50;

w_p = 0.2*pi;
w_s = 0.3*pi;
dw = w_s - w_p;

M = round(1.8*pi/dw);
w1 = rectwin(M);
FinalFilter(M,w1);

M = round(6.1*pi/dw);
w2 = bartlett(M);
FinalFilter(M,w2);

M = round(6.2*pi/dw);
w3 = hann(M);
FinalFilter(M,w3);

%% Part 2
d1 = (1-10^(-R_p/20))/(1+10^(-R_p/20));
d2 = (1+d1)*(10^(-A_s/20));
d = min(d1,d2);
A = -20*log(d);

M = round((A-8)/(2.285*d*dw));
if A>50
    beta = 0.1102*(A-8.7);
elseif A<21
    beta = 0;
else
    beta = (.5842*(A-21)^0.4)+(.07886*(A-21));
end
w6 = kaiser(M,beta);
FinalFilter(M,w6);

function FinalFilter(M,w)
    wvtool(w);
    figure
    n = 0:M-1;
    h_d = sinc(n);
    h = h_d.*w';
    H = fft(h);                      
    subplot(1,2,1)
    plot(1/M*(0:M-1),abs(H));
    xlabel('\omega');
    ylabel('|H(e^{j\omega})|')
    hold on
    subplot(1,2,2)
    plot(1/M*(0:M-1),angle(H));
    xlabel('\omega');
    ylabel('arg(H(e^{j\omega}))')
end