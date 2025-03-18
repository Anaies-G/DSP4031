%3rd computer asignment, DSP
%Anaies Golboudaghians 40122113

%Q6
clc; clear; close all; close all hidden

%% Part 1
pic = imread('image1.jpg'); 
pic = rgb2gray(pic); 
imshow(pic);
title('main image')

E_Signal = mean(pic(:)); 
noise = pic-E_Signal;
E_Noise = mean(noise(:)); 

SNR = 10*log10((E_Signal^2)/(E_Noise^2));
fprintf('SNR of main image is %.3f dB\n', SNR);

%% Part 2

PIC = fft2(pic);
pic_r = ifft2(PIC);
figure
imshow(pic_r,[]);
title('reconstructed image')

%% Part 3
E_Signal_r = mean(pic_r(:)); 
noise_r = pic_r-E_Signal_r;
E_Noise_r = mean(noise_r(:)); 

SNR_r = 10*log10((E_Signal_r^2)/(E_Noise_r^2));
fprintf('SNR of reconstructed image is %.3f dB\n', SNR_r);

%% Part 5
figure
imshow(abs(pic_r),[]);
title('magnitude of reconstructed image')
figure 
imshow(angle(pic_r),[]);
title('phase of reconstructed image')

%% Part 6
PIC_sh = fftshift(PIC);
pic_r_sh = ifft2(PIC_sh);
phase = angle(pic_r_sh);
figure
imagesc(20*log10(abs(pic_r_sh)));
title('magnitude of shifted and reconstructed image in dB')
colorbar;

%% Part 7, A
PIC_7 = fft2(pic);
New_PIC_7 = abs(PIC_7).*exp(1j*phase);
pic_7_r = ifft2(New_PIC_7);
figure
imshow(abs(pic_7_r),[]);
title('magnitude of reconstructed image with the phase of part 6')
figure
imshow(angle(pic_7_r),[])
title('phase of reconstructed image with the phase of part 6')

%% Part 7, B
PIC_7 = fft2(pic);
New_PIC_7 = abs(PIC_7).*exp(1j*angle(PIC_sh));
pic_7_r = ifft2(New_PIC_7);
figure
imshow(abs(pic_7_r),[]);
title('magnitude of reconstructed image with the phase of part 6')
figure
imshow(angle(pic_7_r),[])
title('phase of reconstructed image with the phase of part 6')

%% Part 8
New_PIC_8 = abs(PIC_sh).*exp(1j*angle(PIC));
pic_8_r = ifft2(New_PIC_8);
figure
imshow(abs(pic_8_r),[]);
title('magnitude of shifted and reconstructed image with the phase of input image')
figure
imshow(angle(pic_8_r),[])
title('phase of shifted and reconstructed image with the phase of input image')


%% Part 10
[b,a] = butter(9,300/500,"high");
freqz(b,a,1000)
yy = filter(b,a,pic_r_sh);
figure
imshow(yy,[]);
title('filtered image');

