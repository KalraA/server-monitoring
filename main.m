%  Loads server information data, has X, and Xval, Y, and Yval pre-loaded
load('ServerData.mat');

% find the values for mu and sigma^2 that create the best gaussian curves
[mu sigma2] = estimateGaussian(X);

%create the multi-variate gaussian distribution on the training set.
p = multivariateGaussian(X, mu, sigma2);

%create the multi-variate gaussian distribution on the training set.
pval = multivariateGaussian(Xval, mu, sigma2);

%  Use F1 score to find the best threshhold.
[epsilon F1] = selectThreshold(yval, pval);

fprintf('Total number of outliers: %d/118 \n', sum(p < epsilon));