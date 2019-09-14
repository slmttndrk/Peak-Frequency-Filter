% clear the workspace
clc
clear

% read a sample audiofile
[y,Fs] = audioread('sample.wav');
% find the peaks before applying any filter
pks = findpeaks(y);

% design the first filter with the frequency of 1000
d1 = designfilt('lowpassfir','FilterOrder',8,'CutoffFrequency',1000,'SampleRate',Fs);
f1 = filter(d1,y);
% find the peaks after applying the first filter
pks1 = findpeaks(f1);

% design the first filter with the frequency of 2000
d2 = designfilt('lowpassfir','FilterOrder',8,'CutoffFrequency',2000,'SampleRate',Fs);
f2 = filter(d2,y);
% find the peaks after applying the second filter
pks2 = findpeaks(f2);

% design the first filter with the frequency of 3000
d3 = designfilt('lowpassfir','FilterOrder',8,'CutoffFrequency',3000,'SampleRate',Fs);
f3 = filter(d3,y);
% find the peaks after applying the third filter
pks3 = findpeaks(f3);

% design the first filter with the frequency of 4000
d4 = designfilt('lowpassfir','FilterOrder',8,'CutoffFrequency',4000,'SampleRate',Fs);
f4 = filter(d4,y);
% find the peaks after applying the fourth filter
pks4 = findpeaks(f4);

% collect all cutoff frequencies into an array in order to plot them
cutoff_frequencies = [1000 2000 3000 4000 5000];
% collect the sum of the found peaks into an array in order to plot them
total_num_of_peaks = [length(pks1) length(pks2) length(pks3) length(pks4) length(pks)];

% plot frequencies vs number of peaks
figure(1)
plot(cutoff_frequencies,total_num_of_peaks);
title('PLOT FREQUENCIES VS NUMBER OF PEAKS ALL IN ONE');
xlabel('Cutoff Frequencies');
ylabel('Number Of Peaks');

% plot frequencies vs number of peaks one by one
figure(2)
subplot(4,1,1)
plot(pks1);
title('PLOT FREQUENCIES VS NUMBER OF PEAKS ONE BY ONE');
ylabel('1000');
subplot(4,1,2)
plot(pks2);
ylabel('2000');
subplot(4,1,3)
plot(pks3);
ylabel('3000');
subplot(4,1,4)
plot(pks4);
ylabel('4000');
