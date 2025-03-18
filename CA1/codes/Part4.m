clc; clear; close all
%CA1, Anaies Golboudaghians 40122113 DSP
%Part 4
b = [0.45 0.4 -1];
a = [1 -0.4 -0.45];
y = [0 3];
x = [2 2];
zi = filtic(b, a, y, x);
n = 0:99;
x_input = 2 + ((0.5).^n);
y1 = filter(b, a, x_input, zi);
figure
stem(y1);

[r,p,k] = residuez(b,a);
syms z
H = r(1)/(1-(p(1)*(z^(-1)))) + r(2)/(1-(p(2)*(z^(-1)))) + k;
h = iztrans(H);
h_mf = matlabFunction(h);
h_n = h_mf(n);
y2 = conv(x_input,h_n);
figure
stem(y2);
