clc; clear; close all
%CA1, Anaies Golboudaghians 40122113 DSP
%Part 2
[y, Fs] = audioread("HesapirateDSP.mp3");
disp(Fs);
sound(y, Fs);
pause(22);
y1 = resample(y,Fs*2,Fs);
sound(y1,Fs*2);
audiowrite('Part2_output1.wav',y1,Fs*2);
pause(22);
y2 = resample(y,Fs*.5,Fs);
sound(y2, Fs*.5);
audiowrite('Part2_output2.wav',y2,Fs*.5);