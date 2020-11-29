clc, close all;

s_img = imread('sombrero-galaxy-original.tif');
%ss_img = imshow(s_img);

sombrero_original = double(imread('sombrero-galaxy-original.tif'));
%sombrero_show = imshow(sombrero_original);

original_size = size(sombrero_original); %% 1548 2238

% original_size_2 = size(sombrero_original(:,:,1));  1548 2238 %%

%%initializing
mu = double(0); %% mean
sigma = double(16); %%standard deviation
size_image_in_double = double(sombrero_original);
noise = double(0);
output25 = double(0);
output50 = double(0);
output100 = double(0);

for i = 1:100
    if (i >= 1 && i <= 25)
        noise =+ sigma * randn(original_size) + mu;
        %noise25_show = imshow(noise);
        output25 =+ noise + size_image_in_double;
        output25 =+ max(min(output25, 255),0);
    end
        
    if (i >= 1 && i <=50)
        noise =+ sigma * randn(original_size) + mu;
        %noise50_show = imshow(noise);
        output50 =+ noise + size_image_in_double;
        output50 =+ max(min(output50, 255),0);
    end

    if (i >=1 && i <= 100)
        noise =+ sigma * randn(original_size) + mu;
        %noise100_show = imshow(noise);
        output100 =+ noise + size_image_in_double;
        output100 =+ max(min(output100, 255),0);
    end
end

output25_show = imshow(output25);
output50_show = imshow(output50);
output100_show = imshow(output100);

err25 = size_image_in_double - output25;
mse25 = mean(err25(:).^2) %% 229.6070


err50 = size_image_in_double - output50;
mse50 = mean(err50(:).^2) %% 229.8772

err100 = size_image_in_double - output100;
mse100 = mean(err100(:).^2) %% 229.7724

%questions

    %2
    % smallest at 25 iterations 229.7326
    % largest at 50 iterations 229.9953

    %3.
    %what makes the noise Gaussian and white:
    
    % Gaussian noise is statistical noise having a probability density function (PDF) equal to that of the normal distribution, 
    % which is also known as the Gaussian distribution.
    % In other words, the values that the noise can take on are Gaussian-distributed
    % For digital images, noise is assumed to be additive gaussian white noise.
    % a random signal is considered "white noise" if it is observed to have a flat spectrum over the 
    % range of frequencies that is relevant to the context. 
    % in digital image processing the pixel of a white noise image are arranged in a matrix (rectangular grid), 
    % and are assumed to be independent random variables with uniform probability distribution
    
    
    %4. Does the result of denoising improve with averaging more realizations/images? 
      % How does your answer compare with the MSE for each case?			         
 
    % The result of denoising does not improve with averaging
    % more images
    % As matter of fact, in my model, averaging 100 images tend to
    % have lower MSE than at 50 averaging images. 

    
    %5.
    % Added to the zip file.








