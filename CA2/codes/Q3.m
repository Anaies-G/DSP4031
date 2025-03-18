%2nd computer asignment, DSP
%Anaies Golboudaghians 40122113


%Q3

clc;clear;close all hidden;close all
%% part 0
syms A;
h = [1 A 1];
syms w
for i=1:length(h)
    H_samp(i) = h(i)*exp(-sqrt(-1)*w*(i-1));
end
H = sum(H_samp);
disp(H)



%% part 1
[x , fs] = audioread('sound.wav');
figure;
spectrogram(x ,fs);

X = fft(x);
freqPlot(X,x)


%% part 2

num = [1 -2*cos(pi*.286) 1];
den = 1;
y1 = filter(num , den, x);
figure
spectrogram(y1,fs);

num = [1 -2*cos(pi*.5724) 1];
den = 1;
y2 = filter(num , den, y1);
figure
spectrogram(y2,fs);

num = [1 -2*cos(pi*.8567) 1];
den = 1;
y3 = filter(num , den, y2);
figure
spectrogram(y3,fs);

num = [1 -2*cos(pi*.142) 1];
den = 1;
y4 = filter(num , den, y3);
figure
spectrogram(y4,fs);

num = [1 -2*cos(pi*.428) 1];
den = 1;
y5 = filter(num , den, y4);
figure
spectrogram(y5,fs);


sound(y5,fs);
audiowrite("output.wav",y5,fs);

%% part impulse response
hh1 = [1 -2*cos(pi*.286) 1];
hh2 = [1 -2*cos(pi*.5724) 1];
hh3 = [1 -2*cos(pi*.8567) 1];
hh4 = [1 -2*cos(pi*.142) 1];
hh5 = [1 -2*cos(pi*.428) 1];
hh12 = conv(hh1,hh2);
hh34 = conv(hh3,hh4);
hh1234 = conv(hh12,hh34);
hh = conv(hh5,hh1234);
disp(hh);
yy = filter(hh,1,x);
figure
spectrogram(yy,fs);

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