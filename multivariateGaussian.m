function p = multivariateGaussian(X, mu, Sigma2)

k = length(mu);
% if sigma^2 is not a matrix, then make it a diagonal, or else treat it as the covariance matrix.
if (size(Sigma2, 2) == 1) || (size(Sigma2, 1) == 1)
    Sigma2 = diag(Sigma2);
end
%formula for multi-variate gaussian distribution.
X = bsxfun(@minus, X, mu(:)');
p = (2 * pi) ^ (- k / 2) * det(Sigma2) ^ (-0.5) * ...
    exp(-0.5 * sum(bsxfun(@times, X * pinv(Sigma2), X), 2));

end