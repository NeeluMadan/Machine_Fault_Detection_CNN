% #####################################################################################
% """
% 		main model based on LeNet to train and predict the faults in
% 		machine
% 		Python 3
% 		Pytorch 1.1.0
% 		Author: Neelu Madan
%         Institute: University of Duisburg-Essen
% """
% #####################################################################################

%% clean up
clear all;
close all;
clc;

%% Create datastore and read some random files
imds = imageDatastore('C:\Users\nmadan\Desktop\deeplearning_onMatlab\phm_datachellenge_2009\data\Images','FileExtensions',{'.jpg'},'IncludeSubfolders',true,'LabelSource','foldernames');

figure
numImages = 7000;
perm = randperm(numImages,20);
for i = 1:20
    subplot(4,5,i);
    imshow(imds.Files{perm(i)});
end

%% Training and test split
numTrainingFiles = 500;
[imdsTrain,imdsTest] = splitEachLabel(imds,numTrainingFiles,'randomize');

%% Defining the network architechture
layers = [
    imageInputLayer([48 48 3])
    
    convolution2dLayer(5,6,'Padding','same')
    batchNormalizationLayer
    reluLayer
    
    maxPooling2dLayer(2,'Stride',2)
    
    convolution2dLayer(5,16,'Padding','same')
    batchNormalizationLayer
    reluLayer
    
    maxPooling2dLayer(2,'Stride',2)
    
    convolution2dLayer(5,120,'Padding','same')
    batchNormalizationLayer
    reluLayer
    
    fullyConnectedLayer(84)
    fullyConnectedLayer(13)
    softmaxLayer
    classificationLayer];

%% determining the train option
options = trainingOptions('sgdm', ...
    'MaxEpochs',20,...
    'InitialLearnRate',0.001, ...
    'Shuffle','every-epoch', ...
    'Verbose',false, ...
    'Plots','training-progress');

%% training the network
net = trainNetwork(imdsTrain,layers,options);

%% testing it on validation set
YPred = classify(net,imdsTest);
YTest = imdsTest.Labels;

plotconfusion(YTest,YPred)

accuracy = sum(YPred == YTest)/numel(YTest);
disp(accuracy)