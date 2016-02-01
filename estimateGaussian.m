function [mu sigma2] = estimateGaussian(X)

[m, n] = size(X);

%creating initial values of mu and sigma, parts of the normal distribution curve
mu = sum(X, 1)/m;
sigma2 = sum(bsxfun(@minus,X,mu).^2, 1)/m;

end
