%% 
% #####################################################################################
% """
% 		Reading the train data with labels and create kurtograms
% 		machine
% 		Python 3
% 		Pytorch 1.1.0
% 		Author: Neelu Madan
%         Institute: University of Duisburg-Essen
% """
% #####################################################################################

function [data, labels] = data_preprocessing();


%% clean up
clear all;
close all;
clc;

%% initializing the arrays
data = cell(1, 840);
labels = zeros(1, 840);

f = 6;
for f = 1:6
    file_count = 0;
    Files = dir(['C:/Users/nmadan/Desktop/deeplearning_onMatlab/phm_datachellenge_2009/data/train/helical ',int2str(f),'/*']);
    for k=1:length(Files)
        if ~(Files(k).bytes == 0)
            Data=dlmread(['C:/Users/nmadan/Desktop/deeplearning_onMatlab/phm_datachellenge_2009/data/train/helical ',int2str(f),'/',Files(k).name]);
 %           for col = 1:3
                itr = 0;
                for i = 1:26
                    filename = sprintf('C:/Users/nmadan/Desktop/deeplearning_onMatlab/phm_datachellenge_2009/data/Images/helical %d/Image_%.5d',f,file_count);
                    data{1, 1}  = kurtogram(Data(itr+1:itr+10000, 1));
                    figure('visible', 'off');
                    imagesc(data{1,1})
                    saveas(gcf, filename, 'jpg')
                    itr = itr + 10000;
                    
                    image = filename+".jpg";
                    I = imread(image);
                    J = imresize(I,[48 48]);
                    imwrite(J, image);
                    file_count = file_count + 1;
                    disp(image)
                    disp(itr)
                    clear filename image I J
                    close(gcf) 
                end
                filename = sprintf('C:/Users/nmadan/Desktop/deeplearning_onMatlab/phm_datachellenge_2009/data/Images/helical %d/Image_%.5d',f,file_count);
                data{1, 1}  = kurtogram(Data(itr:end, 1));
                figure('visible', 'off');
                imagesc(data{1,1})
                saveas(gcf, filename, 'jpg')
                
                image = filename+".jpg";
                I = imread(image);
                J = imresize(I,[48 48]);
                imwrite(J, image);
                file_count = file_count + 1;
                disp(image)
                disp(itr)
                close(gcf) 
         %   end
        end
        clear data;
    end
    clear Files k I J filename image itr data col file_count;
end

for f = 1:8
    file_count = 0;
    Files = dir(['C:/Users/nmadan/Desktop/deeplearning_onMatlab/phm_datachellenge_2009/data/train/spur ',int2str(f),'/*']);
    for k=1:length(Files)
        if ~(Files(k).bytes == 0)
            Data=dlmread(['C:/Users/nmadan/Desktop/deeplearning_onMatlab/phm_datachellenge_2009/data/train/spur ',int2str(f),'/',Files(k).name]);
        %    for col = 1:3
                itr = 0;
                for i = 1:26
                    filename = sprintf('C:/Users/nmadan/Desktop/deeplearning_onMatlab/phm_datachellenge_2009/data/Images/spur %d/Image_%.5d',f,file_count);
                    data{1, 1}  = kurtogram(Data(itr+1:itr+10000, 1));
                    figure('visible', 'off');
                    imagesc(data{1,1})
                    saveas(gcf, filename, 'jpg')
                    itr = itr + 10000;
                    
                    image = filename+".jpg";
                    I = imread(image);
                    J = imresize(I,[48 48]);
                    imwrite(J, image);
                    file_count = file_count + 1;
                    disp(image)
                    disp(itr)
                    clear filename image I J
                    close(gcf)                     
                end                                            
                filename = sprintf('C:/Users/nmadan/Desktop/deeplearning_onMatlab/phm_datachellenge_2009/data/Images/spur %d/Image_%.5d',f,file_count);
                data{1, 1}  = kurtogram(Data(itr:end, 1));
                figure('visible', 'off');
                imagesc(data{1,1})
                saveas(gcf, filename, 'jpg')
                
                image = filename+".jpg";
                I = imread(image);
                J = imresize(I,[48 48]);
                imwrite(J, image);
                file_count = file_count + 1;
                disp(image)
                disp(itr)
                close(gcf) 
         %   end
        end
        clear data;
    end
    clear Files k I J filename image itr data col file_count;
end