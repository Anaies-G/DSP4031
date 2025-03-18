clc; clear; close all
%CA1, Anaies Golboudaghians 40122113 DSP
%Part 3

%Q1
num = [1 2 3 4];
den = [4 3 2 1];
w = -4*pi:8*pi/511:4*pi;

h = freqz(num, den, w);

figure
subplot(1,2,1)
plot(w/pi,abs(h));
xlabel('\omega /\pi');
ylabel('|H(e^{j\omega})|')
subplot(1,2,2)
plot(w/pi,angle(h));
xlabel('\omega /\pi');
ylabel('arg(H(e^{j\omega}))');
figure
z = roots(num);
p = roots(den);
zplane(z,p);

%Q2
[x, Fs] = audioread("HesapirateDSP.mp3");
sound(x, Fs)
pause(22);
y = filter(num, den,x,[],2);
sound(y,Fs)
audiowrite('output1.wav',y,Fs);
pause(22);

%Q3
num2 = conv(num,num);
num4 = conv(num2, num2);
num8 = conv(num4, num4);
num12 = conv(num4,num8);
num14 = conv(num12,num2);
num15 = conv(num,num14);

den2 = conv(den,den);
den4 = conv(den2, den2);
den8 = conv(den4, den4);
den12 = conv(den4,den8);
den14 = conv(den12,den2);
den15 = conv(den,den14);

h2 = freqz(num15,den15, w);
figure
subplot(1,2,1)
plot(w/pi,abs(h2));
xlabel('\omega /\pi');
ylabel('|H(e^{j\omega})|')
subplot(1,2,2)
plot(w/pi,angle(h2));
xlabel('\omega /\pi');
ylabel('arg(H(e^{j\omega}))');
figure
z = roots(num15);
p = roots(den15);
zplane(z,p);

%Q4
y2 = filter(num15, den15,x,[],2);
sound(y2,Fs)
pause(22);
audiowrite('output2.wav',y2,Fs);

%Q5
num30 = conv(num15,num15);
num45 = conv(num15,num30);
num49 = conv(num45,num4);
num50 = conv(num49,num);

den30 = conv(den15,den15);
den45 = conv(den15,den30);
den49 = conv(den45,den4);
den50 = conv(den49,den);
h3 = freqz(num50,den50, w);
figure
subplot(1,2,1)
plot(w/pi,abs(h3));
xlabel('\omega /\pi');
ylabel('|H(e^{j\omega})|')
subplot(1,2,2)
plot(w/pi,angle(h3));
xlabel('\omega /\pi');
ylabel('arg(H(e^{j\omega}))');
figure
z = roots(num50);
p = roots(den50);
zplane(z,p);

y3 = filter(num50, den50,x,[],2);
sound(y3,Fs)
audiowrite('output3.wav',y,Fs);