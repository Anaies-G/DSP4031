%2nd computer asignment, DSP
%Anaies Golboudaghians 40122113


%Q2
%% part 1
clc;clear;close all;close all hidden
t = 0:(1/512):(1-(1/512));
x = cos(2*pi*10.*t) + 0.5*cos((2*pi*20.*t)+(pi/2));
X = fft(x);
freqPlot(X,x);


%% part 2
f = (0:length(x)-1)*(1/length(x));
f_range = [0.29,0.33];
f_i = f>=f_range(1) & f<=f_range(2);
noise = 100*rand(size(X));
X(f_i) = X(f_i) + noise(f_i);
freqPlot(X,x);
x_r = ifft(X);
figure
subplot(1,2,1)
plot(t,x);
title("time domain, without noise");
subplot(1,2,2)
plot(t,x_r);
title("time domain, with noise");

%% part 3
fs = 1000;
w_p = [(0.2) (0.45)];
[b,a] = cheby1(3,.001,w_p,"stop");
figure
freqz(b,a,[],fs)
[H,W] = freqz(b,a,[],fs);
HH = H';
Y = X.*HH;
freqPlot(Y,x);
y = ifft(Y);
figure
plot(t,y);
title("time domain, after filtering");

%% part 4
fs_des = 1000;
w_p_des = [(0.2) (0.45)];
[b_des,a_des] = cheby2(3,.001,w_p,"stop");
figure
freqz(b_des,a_des,[],fs_des)
[H_ds,W_ds] = freqz(b_des,a_des,[],fs_des);
HH_ds = H_ds';
Y_ds = X.*HH_ds;
freqPlot(Y_ds,x);
y_ds = ifft(Y_ds);
figure
plot(t,y_ds);
title("time domain, after filtering");

%% part 6
fs_b = 100;
[bd, ad] = butter(10,[0.02 0.08],"stop");
figure
freqz(bd,ad,[],fs_b)
[bt, at] = butter(10,[0.08 0.16],"stop");
figure
freqz(bt,at,[],fs_b)
[ba, aa] = butter(10,[0.16 0.24],"stop");
figure
freqz(ba,aa,[],fs_b)
[bb, ab] = butter(10,[0.24 0.6],"stop");
figure
freqz(bb,ab,[],fs_b)


%% part 7
[HB, WB]=freqz(bb,ab,[],fs_b);
HHB=HB';
Y2 = X.*HHB;
freqPlot(Y2,x);
title('n=10');
[bb2, ab2] = butter(150,[0.24 0.6],"stop");
figure
freqz(bb2,ab2,[],fs_b)
[H2, W2] = freqz(bb2,ab2,[],fs_b);
HH2 = H2';
Y3 = X.*HH2;
freqPlot(Y3,x);

function freqPlot(X,x)
    figure
    w_sample=1/length(x)*(0:length(x)-1);
    subplot(1,2,1)
    plot(w_sample,abs(X),"LineWidth",1);
    xlabel('\omega');
    ylabel('|H(e^{j\omega})|')
    hold on
    subplot(1,2,2)
    plot(w_sample,angle(X),"LineWidth",1);
    xlabel('\omega');
    ylabel('arg(H(e^{j\omega}))')
end

