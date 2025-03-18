%3rd computer asignment, DSP
%Anaies Golboudaghians 40122113

%Q7
clc; clear; close all; close all hidden

%% Part 1
pic = imread('image2.png');
PIC = fft2(pic);
imshow(pic,[])
figure
imshow(abs(PIC),[]);
title('Magnitude in frequency domain')
figure
imshow(angle(PIC),[]);
title('Phase in frequency domain')

figure
stem(abs(PIC(:,1)));

%% Part 2
fs = 1000;
N = size(PIC);

f1 = (0:N(2)-1)*(fs/N(2));             
cutoff = [100 900];                   
H0 = double((f1 <= cutoff(1))|(f1 >= cutoff(2))); 
Y0 = PIC.*H0;

f2 = (0:N(1)-1)*(fs/N(1));   
H = double((f2 <= cutoff(1))|(f2 >= cutoff(2))); 
Y = Y0.*H';

%% Part 3
y = ifft2(Y);
figure
imshow(y,[])
title('after filtering')
y_8b = uint8(y);
imwrite(y_8b,"filteredimage2.png");

