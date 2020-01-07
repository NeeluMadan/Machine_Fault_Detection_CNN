
%% creating a deep learning model to detect the machine tolerance
function [w1, w2, w3, w4] = model(w1, w2, w3, w4, input_image)
 
%% clean up
clear all;
close all;
clc;

for i = 1:5
    data = csvread(['phm_datachellenge_2009/data/Run_',int2str(i),'.csv']);
    kgram1 = kurtogram(data(:,1));
    kgram2 = kurtogram(data(:,2));
    kgram3 = kurtogram(data(:,3));
    
    res
    figure;
    subplot(1,3,1), imagesc(kgram1);
    subplot(1,3,2), imagesc(kgram2);
    subplot(1,3,3), imagesc(kgram3);
  %  pause(0.001)
  %  data
end