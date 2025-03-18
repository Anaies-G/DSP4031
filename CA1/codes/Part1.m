clc; clear; close all

%CA1, Anaies Golboudaghians 40122113 DSP
%Part 1
%Q1
%x1
n1_1 = -10;
n2_1 = 20;
T_1 = 0.01;
n=n1_1:T_1:n2_1;
x1 = (0.8).^n;
figure
DTFT(x1,n1_1,n2_1,T_1);

%x2
n1_2 = 0;
n2_2 = 40;
T_1 = 0.01;
n=n1_2:T_1:n2_2;
x2 = 1;
figure
DTFT(x2, n1_2, n2_2, T_1);

%Q2
%Compressor and sampling
clear n;
f = 10;
T = 1/f;
n1_3 = -4;
n2_3 = 4;

x_d = @(n) (sinc(n)).^2;
y1 = Compressor(x_d,2, n1_3, n2_3, T);
n = n1_3:T:n2_3;
x_d_f = x_d(n);
figure
DTFT(x_d_f,n1_3,n2_3,T);
hold on
DTFT(y1,n1_3,n2_3,T*2);

y2 = Compressor(x_d,4,n1_3,n2_3,T);
figure
DTFT(x_d_f,n1_3,n2_3,T);
hold on
DTFT(y2,n1_3,n2_3,T*4);

function y = Compressor(x, M, n1, n2, T)
    n = n1:M*T:n2;
    y = x(n);
end

function DTFT(x, n1,n2,T)
    syms w
    n=n1:T:n2;
    j = sqrt(-1);
    X = x.*exp(-j.*n*w);
    X_sum = sum(X);
    X_m = matlabFunction(X_sum);
    i=1;
    for w_sample=-pi:0.001:pi
        X_data(i) = X_m(w_sample);
        i=i+1;
    end
    w_sample=-pi:0.001:pi;
    subplot(1,2,1)
    plot(w_sample,abs(X_data));
    xlabel('\omega');
    ylabel('|H(e^{j\omega})|')
    hold on
    subplot(1,2,2)
    plot(w_sample,angle(X_data));
    xlabel('\omega');
    ylabel('arg(H(e^{j\omega}))')
end

